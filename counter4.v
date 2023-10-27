module counter4(CLK, RST, LOAD, COUT, DOUT, DATA, UD);
    input CLK, RST, LOAD, UD;
    input [3:0] DATA;
    output [3:0] DOUT;
    output COUT;
    reg [3:0] Q1;
    reg COUT;

    assign DOUT = Q1;

    always @(posedge CLK) begin  //在时序逻辑中，最好使用同步复位和同步加载。你可以使用一个同步复位信号和一个同步加载信号，并在时钟的上升沿上处理它们。
        if (RST) begin
            Q1 <= 4'b0000;
            COUT <= 0;
        end else if (LOAD) begin
            Q1 <= DATA;
            COUT <= 0;
        end else begin
            if (UD == 1) begin   //UD起选择执行加法器或减法器的作用
                if (Q1 < 4'b1111)
                    Q1 <= Q1 + 1;
                else
                    Q1 <= 4'b0000;
            end else begin
                if (Q1 > 4'b0000)
                    Q1 <= Q1 - 1;
                else
                    Q1 <= 4'b1111;
            end
            if (Q1 == 4'b1111 || Q1 == 4'b0000)
                COUT <= 1;
            else
                COUT <= 0;
        end
    end
endmodule 			
							
							
							