`timescale 1ns / 1ps
module UART(
input logic empty, clk, rst,
input logic [7:0] output_data,
output logic tx, read_en
    );
    parameter baudrate = 9600;
    parameter freq = 50_000_000;
    parameter cycles_per_baud = freq / baudrate;
    logic [12:0] counter;
    logic stop_delay;
    typedef enum logic [2:0] {IDLE, START, DATA, STOP, LATCH} state_t;
    state_t state;
    logic [3:0] current_bit;
    logic [7:0] current_byte;
    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            counter <= 0;
            stop_delay <= 0;
            tx <= 1;
            current_bit <= 0;
        end else if (state == IDLE) begin
            if (!empty) begin
                tx <= 1;
                read_en <= 1;
                state <= LATCH;
            end else begin
                read_en <= 0;
            end
        end
    end
    always_ff @(posedge clk) begin
        if (state == LATCH) begin
            read_en <= 0;
            if (stop_delay) begin
                stop_delay <= 0;
                counter <= 12'b0;
                state <= START;
                current_byte <= output_data;
            end else begin
                counter <= counter + 1;
                if (counter == 10) begin
                    stop_delay <= 1;
                end
            end
        end
    end    

    always_ff @(posedge clk) begin
        if(state == START) begin
            tx <= 0;
                if(stop_delay) begin
                    stop_delay <= 0;
                    counter <= 12'b0;
                    state <= DATA;
                end else begin
                    counter <= counter + 1;
                    if (counter == cycles_per_baud) begin
                        stop_delay <= 1;
                    end
                end
        end
    end
    always_ff @(posedge clk) begin
        if (state == DATA) begin
            if (current_bit <= 4'b0111) begin
                tx <= current_byte[current_bit];
                if(stop_delay) begin
                    stop_delay <= 0;
                    counter <= 12'b0;
                    current_bit <= current_bit + 1;
                end else begin
                    counter <= counter + 1;
                    if (counter == cycles_per_baud) begin
                        stop_delay <= 1;
                    end
                end
            end else begin 
                state <= STOP;
                current_bit <= 0;
            end
        end
    end
    always_ff @(posedge clk) begin
        if (state == STOP) begin
            tx <= 1;
            if(stop_delay) begin
                    stop_delay <= 0;
                    counter <= 12'b0;
                    state <= IDLE;
                end else begin
                    counter <= counter + 1;
                    if (counter == cycles_per_baud) begin
                        stop_delay <= 1;
                    end
                end
        end
    end
endmodule
