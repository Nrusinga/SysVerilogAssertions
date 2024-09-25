// Code your testbench here
// or browse Examples
module dollar_rose();
  bit clk,a;
  always #5 clk = ~clk;
  initial begin: B1
    for (int i = 0;i<20;i++) begin: B2
      a = (i % 2 == 0) ? 1'b0 : 1'b1;
      @(posedge clk);
    end : B2
    
    #10 $stop();
  end: B1
  
  property p1;
    @(posedge clk) $rose (a);
  endproperty: p1
  
  A: assert property (p1);
    always @(posedge clk)
      if($rose(a))
        $display("Assertion passed: $rose(a) detected at time %0t",$time);
    
    initial begin: B3

      $dumpfile("dump.vcd");
      $dumpvars();
    end: B3
  
endmodule: dollar_rose
    