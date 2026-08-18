module UART (clk,
    empty,
    read_en,
    rst,
    tx,
    output_data);
 input clk;
 input empty;
 output read_en;
 input rst;
 output tx;
 input [7:0] output_data;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire stop_delay;
 wire clknet_0_clk;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire [12:0] counter;
 wire [3:0] current_bit;
 wire [7:0] current_byte;
 wire [2:0] state;

 sky130_fd_sc_hd__fill_8 FILLER_0_0 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10 ();
 sky130_fd_sc_hd__fill_4 FILLER_0_109 ();
 sky130_fd_sc_hd__fill_8 FILLER_0_18 ();
 sky130_fd_sc_hd__fill_4 FILLER_0_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33 ();
 sky130_fd_sc_hd__fill_8 FILLER_0_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_58 ();
 sky130_fd_sc_hd__fill_4 FILLER_0_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_0 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_24 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_48 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_53 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_64 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_72 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_88 ();
 sky130_fd_sc_hd__fill_4 FILLER_10_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_100 ();
 sky130_fd_sc_hd__fill_4 FILLER_11_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_112 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_18 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_27 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_35 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_51 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_59 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_71 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_95 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_107 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_111 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_24 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_28 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_31 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_47 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_60 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_68 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_89 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_101 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_109 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_39 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_58 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_8 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_88 ();
 sky130_fd_sc_hd__fill_8 FILLER_14_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_14_101 ();
 sky130_fd_sc_hd__fill_4 FILLER_14_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_14 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_19 ();
 sky130_fd_sc_hd__fill_8 FILLER_14_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_39 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_70 ();
 sky130_fd_sc_hd__fill_4 FILLER_14_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_87 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_89 ();
 sky130_fd_sc_hd__fill_4 FILLER_15_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_15_107 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_22 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_39 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_4 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_88 ();
 sky130_fd_sc_hd__fill_8 FILLER_15_99 ();
 sky130_fd_sc_hd__fill_8 FILLER_16_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_112 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_29 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_37 ();
 sky130_fd_sc_hd__fill_8 FILLER_16_54 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_62 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_66 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_68 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_89 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_112 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_26 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_31 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_39 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_47 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_56 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_69 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_89 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_91 ();
 sky130_fd_sc_hd__fill_4 FILLER_1_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_112 ();
 sky130_fd_sc_hd__fill_4 FILLER_1_21 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_25 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_27 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_4 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_40 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_59 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_72 ();
 sky130_fd_sc_hd__fill_4 FILLER_1_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_2_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_112 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_2 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_25 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_29 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_31 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_71 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_88 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_21 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_39 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_8 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_86 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_4_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_112 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_18 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_24 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_33 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_37 ();
 sky130_fd_sc_hd__fill_8 FILLER_4_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_71 ();
 sky130_fd_sc_hd__fill_8 FILLER_4_82 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_5_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_5_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_26 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_59 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_63 ();
 sky130_fd_sc_hd__fill_8 FILLER_5_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_75 ();
 sky130_fd_sc_hd__fill_4 FILLER_5_8 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_92 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_101 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_13 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_22 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_24 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_29 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_35 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_42 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_63 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_74 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_84 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_7_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_23 ();
 sky130_fd_sc_hd__fill_4 FILLER_7_27 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_38 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_48 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_59 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_61 ();
 sky130_fd_sc_hd__fill_4 FILLER_7_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_73 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_8 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_8_100 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_112 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_23 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_38 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_43 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_47 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_53 ();
 sky130_fd_sc_hd__fill_8 FILLER_8_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_88 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_100 ();
 sky130_fd_sc_hd__fill_4 FILLER_9_108 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_112 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_16 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_33 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_58 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_61 ();
 sky130_fd_sc_hd__fill_4 FILLER_9_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_73 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_77 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_8 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_0 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_1 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_2 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_16 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_17 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_18 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_21 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_3 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_4 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_5 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_6 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_7 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_8 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_10 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_11 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_12 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_13 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_14 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_15 ();
 sky130_fd_sc_hd__clkinv_1 _122_ (.A(state[2]),
    .Y(_103_));
 sky130_fd_sc_hd__clkinv_1 _123_ (.A(state[1]),
    .Y(_104_));
 sky130_fd_sc_hd__clkinv_1 _124_ (.A(stop_delay),
    .Y(_105_));
 sky130_fd_sc_hd__clkinv_1 _125_ (.A(counter[8]),
    .Y(_106_));
 sky130_fd_sc_hd__clkinv_1 _126_ (.A(counter[7]),
    .Y(_107_));
 sky130_fd_sc_hd__clkinv_1 _127_ (.A(counter[2]),
    .Y(_108_));
 sky130_fd_sc_hd__nor2_1 _128_ (.A(state[1]),
    .B(state[0]),
    .Y(_109_));
 sky130_fd_sc_hd__nor3b_1 _129_ (.A(state[1]),
    .B(state[0]),
    .C_N(state[2]),
    .Y(_110_));
 sky130_fd_sc_hd__nand2_1 _130_ (.A(stop_delay),
    .B(_110_),
    .Y(_111_));
 sky130_fd_sc_hd__nor2_1 _131_ (.A(rst),
    .B(_111_),
    .Y(_112_));
 sky130_fd_sc_hd__mux2_1 _132_ (.A0(current_byte[0]),
    .A1(output_data[0]),
    .S(_112_),
    .X(_000_));
 sky130_fd_sc_hd__mux2_1 _133_ (.A0(current_byte[1]),
    .A1(output_data[1]),
    .S(_112_),
    .X(_001_));
 sky130_fd_sc_hd__mux2_1 _134_ (.A0(current_byte[2]),
    .A1(output_data[2]),
    .S(_112_),
    .X(_002_));
 sky130_fd_sc_hd__mux2_1 _135_ (.A0(current_byte[3]),
    .A1(output_data[3]),
    .S(_112_),
    .X(_003_));
 sky130_fd_sc_hd__mux2_1 _136_ (.A0(current_byte[4]),
    .A1(output_data[4]),
    .S(_112_),
    .X(_004_));
 sky130_fd_sc_hd__mux2_1 _137_ (.A0(current_byte[5]),
    .A1(output_data[5]),
    .S(_112_),
    .X(_005_));
 sky130_fd_sc_hd__mux2_1 _138_ (.A0(current_byte[6]),
    .A1(output_data[6]),
    .S(_112_),
    .X(_006_));
 sky130_fd_sc_hd__mux2_1 _139_ (.A0(current_byte[7]),
    .A1(output_data[7]),
    .S(_112_),
    .X(_007_));
 sky130_fd_sc_hd__mux4_2 _140_ (.A0(current_byte[0]),
    .A1(current_byte[1]),
    .A2(current_byte[2]),
    .A3(current_byte[3]),
    .S0(current_bit[0]),
    .S1(current_bit[1]),
    .X(_113_));
 sky130_fd_sc_hd__mux4_2 _141_ (.A0(current_byte[4]),
    .A1(current_byte[5]),
    .A2(current_byte[6]),
    .A3(current_byte[7]),
    .S0(current_bit[0]),
    .S1(current_bit[1]),
    .X(_114_));
 sky130_fd_sc_hd__mux2_1 _142_ (.A0(_113_),
    .A1(_114_),
    .S(current_bit[2]),
    .X(_115_));
 sky130_fd_sc_hd__nor3_1 _143_ (.A(state[2]),
    .B(_104_),
    .C(state[0]),
    .Y(_116_));
 sky130_fd_sc_hd__nor4b_1 _144_ (.A(current_bit[3]),
    .B(state[2]),
    .C(state[0]),
    .D_N(state[1]),
    .Y(_117_));
 sky130_fd_sc_hd__nand2_1 _145_ (.A(current_bit[3]),
    .B(_116_),
    .Y(_118_));
 sky130_fd_sc_hd__a21oi_1 _146_ (.A1(empty),
    .A2(_109_),
    .B1(state[2]),
    .Y(_119_));
 sky130_fd_sc_hd__nand2_1 _147_ (.A(_118_),
    .B(_119_),
    .Y(_120_));
 sky130_fd_sc_hd__or4_1 _148_ (.A(state[2]),
    .B(state[1]),
    .C(state[0]),
    .D(empty),
    .X(_121_));
 sky130_fd_sc_hd__a31oi_1 _149_ (.A1(_103_),
    .A2(state[1]),
    .A3(state[0]),
    .B1(rst),
    .Y(_031_));
 sky130_fd_sc_hd__nand2_1 _150_ (.A(_121_),
    .B(_031_),
    .Y(_032_));
 sky130_fd_sc_hd__a221o_1 _151_ (.A1(_115_),
    .A2(_117_),
    .B1(_120_),
    .B2(tx),
    .C1(_032_),
    .X(_008_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _152_ (.A(state[0]),
    .SLEEP(state[2]),
    .X(_033_));
 sky130_fd_sc_hd__nor2_1 _153_ (.A(_117_),
    .B(_033_),
    .Y(_034_));
 sky130_fd_sc_hd__nor3_1 _154_ (.A(_110_),
    .B(_117_),
    .C(_033_),
    .Y(_035_));
 sky130_fd_sc_hd__nor2_1 _155_ (.A(stop_delay),
    .B(_035_),
    .Y(_036_));
 sky130_fd_sc_hd__lpflow_inputiso1p_1 _156_ (.A(stop_delay),
    .SLEEP(_035_),
    .X(_037_));
 sky130_fd_sc_hd__nor2_1 _157_ (.A(counter[0]),
    .B(_037_),
    .Y(_038_));
 sky130_fd_sc_hd__a21oi_1 _158_ (.A1(counter[0]),
    .A2(_035_),
    .B1(_038_),
    .Y(_039_));
 sky130_fd_sc_hd__nor2_1 _159_ (.A(rst),
    .B(_039_),
    .Y(_009_));
 sky130_fd_sc_hd__nand2_1 _160_ (.A(counter[1]),
    .B(_035_),
    .Y(_040_));
 sky130_fd_sc_hd__a21oi_1 _161_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(_037_),
    .Y(_041_));
 sky130_fd_sc_hd__o21ai_0 _162_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(_041_),
    .Y(_042_));
 sky130_fd_sc_hd__a21oi_1 _163_ (.A1(_040_),
    .A2(_042_),
    .B1(rst),
    .Y(_010_));
 sky130_fd_sc_hd__a31oi_1 _164_ (.A1(counter[2]),
    .A2(counter[1]),
    .A3(counter[0]),
    .B1(_037_),
    .Y(_043_));
 sky130_fd_sc_hd__a21oi_1 _165_ (.A1(counter[2]),
    .A2(_035_),
    .B1(_043_),
    .Y(_044_));
 sky130_fd_sc_hd__a21oi_1 _166_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(counter[2]),
    .Y(_045_));
 sky130_fd_sc_hd__nor3_1 _167_ (.A(rst),
    .B(_044_),
    .C(_045_),
    .Y(_011_));
 sky130_fd_sc_hd__and4_1 _168_ (.A(counter[3]),
    .B(counter[2]),
    .C(counter[1]),
    .D(counter[0]),
    .X(_046_));
 sky130_fd_sc_hd__nor2_1 _169_ (.A(_037_),
    .B(_046_),
    .Y(_047_));
 sky130_fd_sc_hd__a21oi_1 _170_ (.A1(counter[3]),
    .A2(_035_),
    .B1(_047_),
    .Y(_048_));
 sky130_fd_sc_hd__a31oi_1 _171_ (.A1(counter[2]),
    .A2(counter[1]),
    .A3(counter[0]),
    .B1(counter[3]),
    .Y(_049_));
 sky130_fd_sc_hd__nor3_1 _172_ (.A(rst),
    .B(_048_),
    .C(_049_),
    .Y(_012_));
 sky130_fd_sc_hd__a21oi_1 _173_ (.A1(counter[4]),
    .A2(_046_),
    .B1(_037_),
    .Y(_050_));
 sky130_fd_sc_hd__a21oi_1 _174_ (.A1(counter[4]),
    .A2(_035_),
    .B1(_050_),
    .Y(_051_));
 sky130_fd_sc_hd__nor2_1 _175_ (.A(counter[4]),
    .B(_046_),
    .Y(_052_));
 sky130_fd_sc_hd__nor3_1 _176_ (.A(rst),
    .B(_051_),
    .C(_052_),
    .Y(_013_));
 sky130_fd_sc_hd__a31oi_1 _177_ (.A1(counter[5]),
    .A2(counter[4]),
    .A3(_046_),
    .B1(_037_),
    .Y(_053_));
 sky130_fd_sc_hd__a21oi_1 _178_ (.A1(counter[5]),
    .A2(_035_),
    .B1(_053_),
    .Y(_054_));
 sky130_fd_sc_hd__a21oi_1 _179_ (.A1(counter[4]),
    .A2(_046_),
    .B1(counter[5]),
    .Y(_055_));
 sky130_fd_sc_hd__nor3_1 _180_ (.A(rst),
    .B(_054_),
    .C(_055_),
    .Y(_014_));
 sky130_fd_sc_hd__nand4_1 _181_ (.A(counter[6]),
    .B(counter[5]),
    .C(counter[4]),
    .D(_046_),
    .Y(_056_));
 sky130_fd_sc_hd__a22oi_1 _182_ (.A1(counter[6]),
    .A2(_035_),
    .B1(_036_),
    .B2(_056_),
    .Y(_057_));
 sky130_fd_sc_hd__a31oi_1 _183_ (.A1(counter[5]),
    .A2(counter[4]),
    .A3(_046_),
    .B1(counter[6]),
    .Y(_058_));
 sky130_fd_sc_hd__nor3_1 _184_ (.A(rst),
    .B(_057_),
    .C(_058_),
    .Y(_015_));
 sky130_fd_sc_hd__nor2_1 _185_ (.A(_107_),
    .B(_056_),
    .Y(_059_));
 sky130_fd_sc_hd__nor2_1 _186_ (.A(_037_),
    .B(_059_),
    .Y(_060_));
 sky130_fd_sc_hd__a21oi_1 _187_ (.A1(counter[7]),
    .A2(_035_),
    .B1(_060_),
    .Y(_061_));
 sky130_fd_sc_hd__a211oi_1 _188_ (.A1(_107_),
    .A2(_056_),
    .B1(_061_),
    .C1(rst),
    .Y(_016_));
 sky130_fd_sc_hd__nor3_1 _189_ (.A(_106_),
    .B(_107_),
    .C(_056_),
    .Y(_062_));
 sky130_fd_sc_hd__nor2_1 _190_ (.A(_037_),
    .B(_062_),
    .Y(_063_));
 sky130_fd_sc_hd__a21oi_1 _191_ (.A1(_036_),
    .A2(_059_),
    .B1(counter[8]),
    .Y(_064_));
 sky130_fd_sc_hd__nor2_1 _192_ (.A(_035_),
    .B(_063_),
    .Y(_065_));
 sky130_fd_sc_hd__nor3_1 _193_ (.A(rst),
    .B(_064_),
    .C(_065_),
    .Y(_017_));
 sky130_fd_sc_hd__o21ai_0 _194_ (.A1(_035_),
    .A2(_063_),
    .B1(counter[9]),
    .Y(_066_));
 sky130_fd_sc_hd__nor2_1 _195_ (.A(counter[9]),
    .B(_037_),
    .Y(_067_));
 sky130_fd_sc_hd__nand2_1 _196_ (.A(_062_),
    .B(_067_),
    .Y(_068_));
 sky130_fd_sc_hd__a21oi_1 _197_ (.A1(_066_),
    .A2(_068_),
    .B1(rst),
    .Y(_018_));
 sky130_fd_sc_hd__a31oi_1 _198_ (.A1(counter[10]),
    .A2(counter[9]),
    .A3(_062_),
    .B1(_037_),
    .Y(_069_));
 sky130_fd_sc_hd__a21oi_1 _199_ (.A1(counter[10]),
    .A2(_035_),
    .B1(_069_),
    .Y(_070_));
 sky130_fd_sc_hd__a21oi_1 _200_ (.A1(counter[9]),
    .A2(_062_),
    .B1(counter[10]),
    .Y(_071_));
 sky130_fd_sc_hd__nor3_1 _201_ (.A(rst),
    .B(_070_),
    .C(_071_),
    .Y(_019_));
 sky130_fd_sc_hd__nand4_1 _202_ (.A(counter[11]),
    .B(counter[10]),
    .C(counter[9]),
    .D(_062_),
    .Y(_072_));
 sky130_fd_sc_hd__a41oi_1 _203_ (.A1(counter[11]),
    .A2(counter[10]),
    .A3(counter[9]),
    .A4(_062_),
    .B1(_037_),
    .Y(_073_));
 sky130_fd_sc_hd__a41oi_1 _204_ (.A1(counter[10]),
    .A2(counter[9]),
    .A3(_036_),
    .A4(_062_),
    .B1(counter[11]),
    .Y(_074_));
 sky130_fd_sc_hd__nor2_1 _205_ (.A(_035_),
    .B(_073_),
    .Y(_075_));
 sky130_fd_sc_hd__nor3_1 _206_ (.A(rst),
    .B(_074_),
    .C(_075_),
    .Y(_020_));
 sky130_fd_sc_hd__o21ai_0 _207_ (.A1(_035_),
    .A2(_073_),
    .B1(counter[12]),
    .Y(_076_));
 sky130_fd_sc_hd__or3_1 _208_ (.A(counter[12]),
    .B(_037_),
    .C(_072_),
    .X(_077_));
 sky130_fd_sc_hd__a21oi_1 _209_ (.A1(_076_),
    .A2(_077_),
    .B1(rst),
    .Y(_021_));
 sky130_fd_sc_hd__nor4b_1 _210_ (.A(counter[11]),
    .B(counter[1]),
    .C(counter[0]),
    .D_N(counter[10]),
    .Y(_078_));
 sky130_fd_sc_hd__nand4b_1 _211_ (.A_N(counter[5]),
    .B(counter[4]),
    .C(_078_),
    .D(counter[6]),
    .Y(_079_));
 sky130_fd_sc_hd__o21ai_0 _212_ (.A1(_034_),
    .A2(_079_),
    .B1(counter[12]),
    .Y(_080_));
 sky130_fd_sc_hd__nor3b_1 _213_ (.A(counter[4]),
    .B(counter[0]),
    .C_N(counter[1]),
    .Y(_081_));
 sky130_fd_sc_hd__nor4_1 _214_ (.A(counter[11]),
    .B(counter[10]),
    .C(counter[6]),
    .D(counter[5]),
    .Y(_082_));
 sky130_fd_sc_hd__a31oi_1 _215_ (.A1(_110_),
    .A2(_081_),
    .A3(_082_),
    .B1(counter[12]),
    .Y(_083_));
 sky130_fd_sc_hd__nand3_1 _216_ (.A(_107_),
    .B(counter[3]),
    .C(_108_),
    .Y(_084_));
 sky130_fd_sc_hd__nor4_1 _217_ (.A(counter[9]),
    .B(counter[8]),
    .C(_083_),
    .D(_084_),
    .Y(_085_));
 sky130_fd_sc_hd__a21oi_1 _218_ (.A1(_080_),
    .A2(_085_),
    .B1(stop_delay),
    .Y(_086_));
 sky130_fd_sc_hd__nor2_1 _219_ (.A(_105_),
    .B(_035_),
    .Y(_087_));
 sky130_fd_sc_hd__nor3_1 _220_ (.A(rst),
    .B(_086_),
    .C(_087_),
    .Y(_022_));
 sky130_fd_sc_hd__o21ai_0 _221_ (.A1(state[2]),
    .A2(_105_),
    .B1(state[0]),
    .Y(_088_));
 sky130_fd_sc_hd__a31oi_1 _222_ (.A1(_111_),
    .A2(_118_),
    .A3(_088_),
    .B1(rst),
    .Y(_023_));
 sky130_fd_sc_hd__a31oi_1 _223_ (.A1(_103_),
    .A2(state[0]),
    .A3(stop_delay),
    .B1(_104_),
    .Y(_089_));
 sky130_fd_sc_hd__a31oi_1 _224_ (.A1(_104_),
    .A2(stop_delay),
    .A3(_033_),
    .B1(_089_),
    .Y(_090_));
 sky130_fd_sc_hd__nor2_1 _225_ (.A(rst),
    .B(_090_),
    .Y(_024_));
 sky130_fd_sc_hd__o31ai_1 _226_ (.A1(state[1]),
    .A2(state[0]),
    .A3(_105_),
    .B1(state[2]),
    .Y(_091_));
 sky130_fd_sc_hd__a21oi_1 _227_ (.A1(_121_),
    .A2(_091_),
    .B1(rst),
    .Y(_025_));
 sky130_fd_sc_hd__o21ai_0 _228_ (.A1(current_bit[3]),
    .A2(stop_delay),
    .B1(_116_),
    .Y(_092_));
 sky130_fd_sc_hd__and2_0 _229_ (.A(stop_delay),
    .B(_117_),
    .X(_093_));
 sky130_fd_sc_hd__mux2i_1 _230_ (.A0(_093_),
    .A1(_092_),
    .S(current_bit[0]),
    .Y(_094_));
 sky130_fd_sc_hd__nor2_1 _231_ (.A(rst),
    .B(_094_),
    .Y(_026_));
 sky130_fd_sc_hd__xor2_1 _232_ (.A(current_bit[1]),
    .B(current_bit[0]),
    .X(_095_));
 sky130_fd_sc_hd__a22oi_1 _233_ (.A1(current_bit[1]),
    .A2(_092_),
    .B1(_093_),
    .B2(_095_),
    .Y(_096_));
 sky130_fd_sc_hd__nor2_1 _234_ (.A(rst),
    .B(_096_),
    .Y(_027_));
 sky130_fd_sc_hd__nand3_1 _235_ (.A(current_bit[2]),
    .B(current_bit[1]),
    .C(current_bit[0]),
    .Y(_097_));
 sky130_fd_sc_hd__a22oi_1 _236_ (.A1(current_bit[2]),
    .A2(_092_),
    .B1(_093_),
    .B2(_097_),
    .Y(_098_));
 sky130_fd_sc_hd__a21oi_1 _237_ (.A1(current_bit[1]),
    .A2(current_bit[0]),
    .B1(current_bit[2]),
    .Y(_099_));
 sky130_fd_sc_hd__nor3_1 _238_ (.A(rst),
    .B(_098_),
    .C(_099_),
    .Y(_028_));
 sky130_fd_sc_hd__nand2_1 _239_ (.A(current_bit[3]),
    .B(_092_),
    .Y(_100_));
 sky130_fd_sc_hd__nand4_1 _240_ (.A(current_bit[2]),
    .B(current_bit[1]),
    .C(current_bit[0]),
    .D(_093_),
    .Y(_101_));
 sky130_fd_sc_hd__a21oi_1 _241_ (.A1(_100_),
    .A2(_101_),
    .B1(rst),
    .Y(_029_));
 sky130_fd_sc_hd__o31ai_1 _242_ (.A1(state[1]),
    .A2(state[0]),
    .A3(rst),
    .B1(read_en),
    .Y(_102_));
 sky130_fd_sc_hd__o41ai_1 _243_ (.A1(state[1]),
    .A2(state[0]),
    .A3(rst),
    .A4(_121_),
    .B1(_102_),
    .Y(_030_));
 sky130_fd_sc_hd__dfxtp_1 _244_ (.CLK(clknet_2_1__leaf_clk),
    .D(_000_),
    .Q(current_byte[0]));
 sky130_fd_sc_hd__dfxtp_1 _245_ (.CLK(clknet_2_1__leaf_clk),
    .D(_001_),
    .Q(current_byte[1]));
 sky130_fd_sc_hd__dfxtp_1 _246_ (.CLK(clknet_2_1__leaf_clk),
    .D(_002_),
    .Q(current_byte[2]));
 sky130_fd_sc_hd__dfxtp_1 _247_ (.CLK(clknet_2_1__leaf_clk),
    .D(_003_),
    .Q(current_byte[3]));
 sky130_fd_sc_hd__dfxtp_1 _248_ (.CLK(clknet_2_0__leaf_clk),
    .D(_004_),
    .Q(current_byte[4]));
 sky130_fd_sc_hd__dfxtp_1 _249_ (.CLK(clknet_2_1__leaf_clk),
    .D(_005_),
    .Q(current_byte[5]));
 sky130_fd_sc_hd__dfxtp_1 _250_ (.CLK(clknet_2_0__leaf_clk),
    .D(_006_),
    .Q(current_byte[6]));
 sky130_fd_sc_hd__dfxtp_1 _251_ (.CLK(clknet_2_0__leaf_clk),
    .D(_007_),
    .Q(current_byte[7]));
 sky130_fd_sc_hd__dfxtp_1 _252_ (.CLK(clknet_2_0__leaf_clk),
    .D(_008_),
    .Q(tx));
 sky130_fd_sc_hd__dfxtp_1 _253_ (.CLK(clknet_2_2__leaf_clk),
    .D(_009_),
    .Q(counter[0]));
 sky130_fd_sc_hd__dfxtp_1 _254_ (.CLK(clknet_2_2__leaf_clk),
    .D(_010_),
    .Q(counter[1]));
 sky130_fd_sc_hd__dfxtp_1 _255_ (.CLK(clknet_2_2__leaf_clk),
    .D(_011_),
    .Q(counter[2]));
 sky130_fd_sc_hd__dfxtp_1 _256_ (.CLK(clknet_2_2__leaf_clk),
    .D(_012_),
    .Q(counter[3]));
 sky130_fd_sc_hd__dfxtp_1 _257_ (.CLK(clknet_2_2__leaf_clk),
    .D(_013_),
    .Q(counter[4]));
 sky130_fd_sc_hd__dfxtp_1 _258_ (.CLK(clknet_2_2__leaf_clk),
    .D(_014_),
    .Q(counter[5]));
 sky130_fd_sc_hd__dfxtp_1 _259_ (.CLK(clknet_2_3__leaf_clk),
    .D(_015_),
    .Q(counter[6]));
 sky130_fd_sc_hd__dfxtp_1 _260_ (.CLK(clknet_2_3__leaf_clk),
    .D(_016_),
    .Q(counter[7]));
 sky130_fd_sc_hd__dfxtp_1 _261_ (.CLK(clknet_2_3__leaf_clk),
    .D(_017_),
    .Q(counter[8]));
 sky130_fd_sc_hd__dfxtp_1 _262_ (.CLK(clknet_2_3__leaf_clk),
    .D(_018_),
    .Q(counter[9]));
 sky130_fd_sc_hd__dfxtp_1 _263_ (.CLK(clknet_2_3__leaf_clk),
    .D(_019_),
    .Q(counter[10]));
 sky130_fd_sc_hd__dfxtp_1 _264_ (.CLK(clknet_2_3__leaf_clk),
    .D(_020_),
    .Q(counter[11]));
 sky130_fd_sc_hd__dfxtp_1 _265_ (.CLK(clknet_2_3__leaf_clk),
    .D(_021_),
    .Q(counter[12]));
 sky130_fd_sc_hd__dfxtp_1 _266_ (.CLK(clknet_2_2__leaf_clk),
    .D(_022_),
    .Q(stop_delay));
 sky130_fd_sc_hd__dfxtp_1 _267_ (.CLK(clknet_2_0__leaf_clk),
    .D(_023_),
    .Q(state[0]));
 sky130_fd_sc_hd__dfxtp_1 _268_ (.CLK(clknet_2_0__leaf_clk),
    .D(_024_),
    .Q(state[1]));
 sky130_fd_sc_hd__dfxtp_1 _269_ (.CLK(clknet_2_0__leaf_clk),
    .D(_025_),
    .Q(state[2]));
 sky130_fd_sc_hd__dfxtp_1 _270_ (.CLK(clknet_2_1__leaf_clk),
    .D(_026_),
    .Q(current_bit[0]));
 sky130_fd_sc_hd__dfxtp_1 _271_ (.CLK(clknet_2_1__leaf_clk),
    .D(_027_),
    .Q(current_bit[1]));
 sky130_fd_sc_hd__dfxtp_1 _272_ (.CLK(clknet_2_1__leaf_clk),
    .D(_028_),
    .Q(current_bit[2]));
 sky130_fd_sc_hd__dfxtp_1 _273_ (.CLK(clknet_2_1__leaf_clk),
    .D(_029_),
    .Q(current_bit[3]));
 sky130_fd_sc_hd__dfxtp_1 _274_ (.CLK(clknet_2_0__leaf_clk),
    .D(_030_),
    .Q(read_en));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_1 clkload0 (.A(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkload1 (.A(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_8 clkload2 (.A(clknet_2_3__leaf_clk));
endmodule
