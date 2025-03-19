`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 12:30:07 AM
// Design Name: 
// Module Name: traffic_light_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller_tb;

reg clk;
reg rst;

wire [2:0] light_M1;
wire [2:0] light_MT;
wire [2:0] light_M2;
wire [2:0] light_S;
wire [2:0] count;

traffic_light_controller uut(
    .clk(clk),
    .rst(rst),
    .light_M1(light_M1),
    .light_MT(light_MT),
    .light_M2(light_M2),
    .light_S(light_S),
    .count(count)
);

initial 
begin
    clk = 1'b0;                // Start clock at 0 for proper toggling
    forever #5 clk = ~clk;
end 

initial
begin 
    rst = 1'b1;
    #15
    rst = 1'b0;
    #1000;
    $stop;
end 

endmodule
