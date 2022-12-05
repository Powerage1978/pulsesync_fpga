class generator;
	
	bit [31:0]addr;
	bit [31:0]data;
	rand bit [3:0] burst;
	transaction tr;
	mailbox #(transaction) m1;
	
	//mailbox constructor
	function new(mailbox #(transaction) m1);	
        $display("Entering Generator block");
        this.m1=m1;	
	endfunction

    task run (bit readwrite,integer count);
    endtask;

endclass: generator