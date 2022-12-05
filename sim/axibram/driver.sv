class driver;
	transaction tr;
	mailbox #(transaction) m1;
	virtual interface intf.driver_port vif;
	
	//mailbox and virtual interface construct
	function new(mailbox #(transaction) m1,virtual interface intf.driver_port vif);
		$display("Entering in driver block");
		this.m1=m1;
		this.vif=vif;
	endfunction

	task run();
		$display("Driver sending singals to bus system\n");	
		forever begin
		
		end
	endtask

	task reset();	
	$display("Bus System Reset\n");			
endtask
   	

endclass: driver