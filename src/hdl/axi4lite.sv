`timescale 1 ns / 1 ps

import axi4lite_pkg::*;
module axi4lite #
	(
)
	(
    input logic [C_DATA_WIDTH-1 : 0] status,
	// output wire [C_DATA_WIDTH-1 : 0] doutb,

	// Global Clock Signal
	input logic  s_axi_aclk,
	// Global Reset Signal. This Signal is Active LOW
	input logic  s_axi_aresetn,
	// Write address (issued by master, acceped by Slave)
	input logic [C_ADDR_WIDTH-1 : 0] s_axi_awaddr,
	// Write channel Protection type. This signal indicates the
	// privilege and security level of the transaction, and whether
	// the transaction is a data access or an instruction access.
	input logic [2 : 0] s_axi_awprot,
	// Write address valid. This signal indicates that the master signaling
	// valid write address and control information.
	input logic  s_axi_awvalid,
	// Write address ready. This signal indicates that the slave is ready
	// to accept an address and associated control signals.
	output logic  s_axi_awready,
	// Write data (issued by master, acceped by Slave) 
	input logic [C_DATA_WIDTH-1 : 0] s_axi_wdata,
	// Write strobes. This signal indicates which byte lanes hold
	// valid data. There is one write strobe bit for each eight
	// bits of the write data bus.    
	input logic [(C_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
	// Write valid. This signal indicates that valid write
	// data and strobes are available.
	input logic  s_axi_wvalid,
	// Write ready. This signal indicates that the slave
	// can accept the write data.
	output logic  s_axi_wready,
	// Write response. This signal indicates the status
	// of the write transaction.
	output logic [1 : 0] s_axi_bresp,
	// Write response valid. This signal indicates that the channel
	// is signaling a valid write response.
	output logic  s_axi_bvalid,
	// Response ready. This signal indicates that the master
	// can accept a write response.
	input logic  s_axi_bready,
	// Read address (issued by master, acceped by Slave)
	input logic [C_ADDR_WIDTH-1 : 0] s_axi_araddr,
	// Protection type. This signal indicates the privilege
	// and security level of the transaction, and whether the
	// transaction is a data access or an instruction access.
	input logic [2 : 0] s_axi_arprot,
	// Read address valid. This signal indicates that the channel
	// is signaling valid read address and control information.
	input logic  s_axi_arvalid,
	// Read address ready. This signal indicates that the slave is
	// ready to accept an address and associated control signals.
	output logic  s_axi_arready,
	// Read data (issued by slave)
	output logic [C_DATA_WIDTH-1 : 0] s_axi_rdata,
	// Read response. This signal indicates the status of the
	// read transfer.
	output logic [1 : 0] s_axi_rresp,
	// Read valid. This signal indicates that the channel is
	// signaling the required read data.
	output logic  s_axi_rvalid,
	// Read ready. This signal indicates that the master can
	// accept the read data and response information.
	input logic  s_axi_rready
);

	// AXI4LITE signals
	logic [C_ADDR_WIDTH-1 : 0] axi_awaddr;
	logic [C_ADDR_WIDTH-1 : 0] axi_araddr;


	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 2
	logic [C_DATA_WIDTH-1:0]      control_reg;
    logic [C_DATA_WIDTH-1:0]      status_reg;
    logic                         slv_reg_rden;
	logic                         slv_reg_wren;
	logic [C_DATA_WIDTH-1:0]      reg_data_out;
	logic                         aw_en;
    integer                       byte_index;


	// Implement s_axi_awready generation
	// s_axi_awready is asserted for one s_axi_aclk clock cycle when both
	// s_axi_awvalid and s_axi_wvalid are asserted. s_axi_awready is
	// de-asserted when reset is low.

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            s_axi_awready <= 1'b0;
            aw_en <= 1'b1;
		end
		else begin
            if (~s_axi_awready && s_axi_awvalid && s_axi_wvalid && aw_en) begin
                // slave is ready to accept write address when 
                // there is a valid write address and write data
                // on the write address and data bus. This design 
                // expects no outstanding transactions. 
                s_axi_awready <= 1'b1;
                aw_en <= 1'b0;
            end
            else if (s_axi_bready && s_axi_bvalid) begin
                aw_en <= 1'b1;
                s_axi_awready <= 1'b0;
            end
            else begin
                s_axi_awready <= 1'b0;
            end
		end
	end

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// s_axi_awvalid and s_axi_wvalid are valid. 

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
				axi_awaddr <= 0;
		end
		else begin
            if (~s_axi_awready && s_axi_awvalid && s_axi_wvalid && aw_en)	begin
                // Write Address latching 
                axi_awaddr <= s_axi_awaddr;
            end
		end
	end

	// Implement s_axi_wready generation
	// s_axi_wready is asserted for one s_axi_aclk clock cycle when both
	// s_axi_awvalid and s_axi_wvalid are asserted. s_axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
			s_axi_wready <= 1'b0;
		end
		else begin
            if (~s_axi_wready && s_axi_wvalid && s_axi_awvalid && aw_en ) begin
                // slave is ready to accept write data when 
                // there is a valid write address and write data
                // on the write address and data bus. This design 
                // expects no outstanding transactions. 
                s_axi_wready <= 1'b1;
            end
            else begin
                s_axi_wready <= 1'b0;
            end
		end
	end

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// s_axi_awready, s_axi_wvalid, s_axi_wready and s_axi_wvalid are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = s_axi_wready && s_axi_wvalid && s_axi_awready && s_axi_awvalid;

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            control_reg <= 0;
		end
		else begin
			if (slv_reg_wren) begin
				if (axi_awaddr[C_ADDR_WIDTH-1:0] == {C_ADDR_WIDTH{1'b0}}) begin
					for ( byte_index = 0; byte_index <= (C_DATA_WIDTH/8)-1; byte_index = byte_index+1 ) begin
						if ( s_axi_wstrb[byte_index] == 1 ) begin
                            // Respective byte enables are asserted as per write strobes 
                            // Slave register 0
                            control_reg[(byte_index*8) +: 8] <= s_axi_wdata[(byte_index*8) +: 8];
                        end
						else begin
							control_reg <= control_reg;
						end
					end
				end
			end
		end
	end

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when s_axi_wready, s_axi_wvalid, s_axi_wready and s_axi_wvalid are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b0;
        end
		else begin
            if (s_axi_awready && s_axi_awvalid && ~s_axi_bvalid && s_axi_wready && s_axi_wvalid) begin
                // indicates a valid write response is available
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= 2'b0; // 'OKAY' response 
            end // work error responses in future
            else begin
                if (s_axi_bready && s_axi_bvalid) begin
                    //check if bready is asserted while bvalid is high) 
                    //(there is a possibility that bready is always asserted high)   
                    s_axi_bvalid <= 1'b0;
                end
            end
		end
	end

	// Implement s_axi_arready generation
	// s_axi_arready is asserted for one s_axi_aclk clock cycle when
	// s_axi_arvalid is asserted. s_axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when s_axi_arvalid is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            s_axi_arready <= 1'b0;
            axi_araddr  <= {C_ADDR_WIDTH{1'b0}};
        end
		else begin
            if (~s_axi_arready && s_axi_arvalid) begin
                // indicates that the slave has acceped the valid read address
                s_axi_arready <= 1'b1;
                // Read address latching
                axi_araddr  <= s_axi_araddr;
            end
            else begin
                s_axi_arready <= 1'b0;
            end
		end
	end

	// Implement axi_arvalid generation
	// s_axi_rvalid is asserted for one s_axi_aclk clock cycle when both 
	// s_axi_arvalid and s_axi_arready are asserted. The slave registers 
	// data are available on the s_axi_rdata bus at this instance. The 
	// assertion of s_axi_rvalid marks the validity of read data on the 
	// bus and s_axi_rresp indicates the status of read transaction. s_axi_rvalid 
	// is deasserted on reset (active low). s_axi_rresp and s_axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            s_axi_rvalid <= 1'b0;
            s_axi_rresp  <= 2'b0;
        end
		else begin
            if (s_axi_arready && s_axi_arvalid && ~s_axi_rvalid) begin
                // Valid read data is available at the read data bus
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= 2'b0; // 'OKAY' response
            end
            else if (s_axi_rvalid && s_axi_rready) begin
                // Read data is accepted by the master
                s_axi_rvalid <= 1'b0;
            end
        end
	end

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = s_axi_arready & s_axi_arvalid & ~s_axi_rvalid;
	always @(*)
	begin
		// Address decoding for reading registers
		case ( axi_araddr[C_ADDR_LSB+C_OPT_MEM_ADDR_BITS : C_ADDR_LSB] )
			2'h0   : reg_data_out <= control_reg;
            2'h1   : reg_data_out <= status_reg;
			default : reg_data_out <= {C_DATA_WIDTH{1'b0}};
		endcase
	end

	// Output register or memory read data
	always @( posedge s_axi_aclk )
	begin
		if ( s_axi_aresetn == 1'b0 ) begin
            s_axi_rdata  <= {C_DATA_WIDTH{1'b0}};
        end
		else begin
            // When there is a valid read address (s_axi_arvalid) with 
            // acceptance of read address by the slave (s_axi_arready), 
            // output the read dada 
            if (slv_reg_rden) begin
                s_axi_rdata <= reg_data_out; // register read data
            end
        end
	end

    // Status register output
    always @( posedge s_axi_aclk)
    begin
        if (s_axi_aresetn == 1'b0) begin
            status_reg  <= {C_DATA_WIDTH{1'b0}};
        end
        else begin
            status_reg <= status;
        end
    end

endmodule
