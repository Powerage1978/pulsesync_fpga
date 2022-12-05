class monitor;
	transaction tr2;
	mailbox #(transaction) m2;
	virtual interface intf.monitor_port vif;
	
	//mailbox and virtual interface construct
	function new(mailbox #(transaction) m2,virtual interface intf.monitor_port vif);
		$display("Entering in monitor block");
		this.m2=m2;
		this.vif=vif;
	endfunction

    function void get_signals(transaction tr2);
    endfunction

    task run();
		forever begin
        end
		$display("\n\n----------packet receive from memory---------\n\n");
	endtask

endclass: monitor