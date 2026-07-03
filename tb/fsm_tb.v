//=========================================================
// Testbench for Traffic Light Controller
// Description: Generates clock and reset signals,
//              verifies state transitions, and creates
//              a VCD file for GTKWave simulation.
//=========================================================
`timescale 1ns/1ps

module fsm_tb;
// Declare signals for the FSM
reg clk;
reg reset;

wire red;
wire yellow;
wire green;
// Instantiate the FSM module
fsm uut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock generation
always #5 clk = ~clk;
// Test sequence
initial
begin
    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #60;

    $finish;
end

initial
begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, fsm_tb);
end

endmodule