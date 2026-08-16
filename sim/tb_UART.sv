`timescale 1ns / 1ps

module tb_UART;

    // Clock period: 50 MHz -> 20ns period (matches UART's freq=50_000_000 parameter)
    localparam CLK_PERIOD = 20;

    logic clk;
    logic rst;
    logic empty;
    logic [7:0] output_data;
    logic tx;
    logic read_en;

    // Instantiate DUT
    UART dut (
        .empty(empty),
        .clk(clk),
        .rst(rst),
        .output_data(output_data),
        .tx(tx),
        .read_en(read_en)
    );

    // Clock generation
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // Waveform dump
    initial begin
        $dumpfile("tb_UART.vcd");
        $dumpvars(0, tb_UART);
    end

    // Bit-check bookkeeping
    logic [7:0] test_byte;
    integer bit_idx;
    integer errors;

    // Task: wait for one baud period's worth of clock edges by watching for
    // the DUT's internal bit steps. Simpler and more robust: just sample tx
    // at the midpoint of each expected bit window using cycle counts derived
    // from the DUT's own timing (LATCH=11 cycles, each data/start/stop bit
    // = cycles_per_baud+1 cycles). We recompute those constants here to
    // keep the testbench self-checking without hierarchical references.
    localparam CYCLES_PER_BAUD = 50_000_000 / 9600; // 5208
    localparam LATCH_CYCLES    = 11;

    task automatic wait_cycles(input integer n);
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) @(posedge clk);
        end
    endtask

    initial begin
        errors = 0;
        test_byte = 8'b10110101; // 0xB5 -- deliberately asymmetric pattern

        rst = 1;
        empty = 1;        // no data available yet
        output_data = 8'h00;
        wait_cycles(5);
        rst = 0;
        wait_cycles(5);

        // Present data to the UART
        output_data = test_byte;
        empty = 0;         // data available

        // --- Check tx idles high before anything happens ---
        if (tx !== 1'b1) begin
            $display("FAIL: tx not idle-high before transaction, tx=%b", tx);
            errors = errors + 1;
        end else begin
            $display("PASS: tx idle-high at start");
        end

        // Wait through IDLE->LATCH transition (1 cycle) + LATCH settle (LATCH_CYCLES)
        // plus a small margin, landing us just after state should be START.
        wait_cycles(1 + LATCH_CYCLES + 2);

        // --- Check start bit ---
        // We're now mid-way into START state; sample near the end of the
        // start bit window (just before it flips to DATA) to be safely
        // inside the bit, then move to midpoints for the rest.
        wait_cycles(CYCLES_PER_BAUD/2);
        if (tx !== 1'b0) begin
            $display("FAIL: start bit incorrect, tx=%b (expected 0)", tx);
            errors = errors + 1;
        end else begin
            $display("PASS: start bit = 0");
        end
        wait_cycles(CYCLES_PER_BAUD/2 + 1); // finish out the start bit window

        // --- Check 8 data bits, LSB first ---
        for (bit_idx = 0; bit_idx < 8; bit_idx = bit_idx + 1) begin
            wait_cycles(CYCLES_PER_BAUD/2);
            if (tx !== test_byte[bit_idx]) begin
                $display("FAIL: data bit %0d incorrect, tx=%b expected=%b",
                          bit_idx, tx, test_byte[bit_idx]);
                errors = errors + 1;
            end else begin
                $display("PASS: data bit %0d = %b", bit_idx, tx);
            end
            wait_cycles(CYCLES_PER_BAUD/2 + 1);
        end

        // --- Check stop bit ---
        wait_cycles(CYCLES_PER_BAUD/2);
        if (tx !== 1'b1) begin
            $display("FAIL: stop bit incorrect, tx=%b (expected 1)", tx);
            errors = errors + 1;
        end else begin
            $display("PASS: stop bit = 1");
        end
        wait_cycles(CYCLES_PER_BAUD/2 + 1);

        // --- Check read_en pulsed during the transaction ---
        // (informational check via monitor below, not a hard pass/fail here)

        wait_cycles(20);

        if (errors == 0) begin
            $display("=== ALL CHECKS PASSED ===");
        end else begin
            $display("=== %0d CHECK(S) FAILED ===", errors);
        end

        $finish;
    end

    // Simple monitor for read_en pulse (informational)
    always @(posedge clk) begin
        if (read_en) $display("[%0t] read_en asserted, state-driven byte capture in progress", $time);
    end

endmodule