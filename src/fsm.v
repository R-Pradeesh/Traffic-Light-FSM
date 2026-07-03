//=========================================================
// Project    : Traffic Light Controller
// Author     : Rayi Pradeesh
// Language   : Verilog HDL
// Description: Implements a traffic light controller using
//              a Finite State Machine (FSM). The controller
//              cycles through RED, GREEN, and YELLOW states
//              based on the clock signal.
//=========================================================
module fsm(
    input clk, //generate clock signal 
    input reset,// apply reset to the system
    output reg red,// output for red light
    output reg yellow,// output for yellow light
    output reg green// output for green light
);

reg [1:0] state;// current state of the FSM

parameter RED = 2'b00,// define the states of the FSM
          GREEN = 2'b01,
          YELLOW = 2'b10;
// State transition logic
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= RED;
    else
    begin
        case(state)
            RED:    state <= GREEN;
            GREEN:  state <= YELLOW;
            YELLOW: state <= RED;
            default: state <= RED;
        endcase
    end
end
// Output logic based on the current state
always @(*)
begin
    red = 0;
    yellow = 0;
    green = 0;

    case(state)
        RED:    red = 1;
        GREEN:  green = 1;
        YELLOW: yellow = 1;
    endcase
end

endmodule