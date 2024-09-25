module dollar_fell();
  bit clk,a;
  
  always #5 clk = ~clk;
  
  
  always @(posedge clk) begin: B4
      for(int i=0;i<20;i++) begin: B2
        a=(i%3==0) ? 1'b0 : 1'b1;
        @(posedge clk);
      end: B2

      #10 $stop();


  end:B4
  
  property p1();
    always @(posedge clk) $fell(a);
  endproperty:p1
  
  A:assert property (p1);
    
  always @(posedge clk)
  	if($fell(a))
    	$display("Assertion passed; $fell(a) detected at %0t",$time);
    
  initial begin:B3
    $dumpfile("dump.vcd");
    $dumpvars();
  end:B3
   
    
endmodule:dollar_fell
                
    