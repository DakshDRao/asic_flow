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

 sky130_fd_sc_hd__fill_4 FILLER_0_0 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_111 ();
 sky130_fd_sc_hd__fill_8 FILLER_0_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4 ();
 sky130_fd_sc_hd__fill_8 FILLER_0_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_59 ();
 sky130_fd_sc_hd__fill_4 FILLER_0_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_10_108 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_11 ();
 sky130_fd_sc_hd__fill_4 FILLER_10_21 ();
 sky130_fd_sc_hd__fill_8 FILLER_10_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_39 ();
 sky130_fd_sc_hd__fill_4 FILLER_10_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_57 ();
 sky130_fd_sc_hd__fill_4 FILLER_10_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_78 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_18 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_24 ();
 sky130_fd_sc_hd__fill_4 FILLER_11_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_43 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_61 ();
 sky130_fd_sc_hd__fill_8 FILLER_11_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_73 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_78 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_93 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_108 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_21 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_29 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_37 ();
 sky130_fd_sc_hd__fill_8 FILLER_12_47 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_12_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_37 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_45 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_59 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_13_90 ();
 sky130_fd_sc_hd__fill_8 FILLER_13_98 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_14_100 ();
 sky130_fd_sc_hd__fill_4 FILLER_14_108 ();
 sky130_fd_sc_hd__fill_4 FILLER_14_25 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_29 ();
 sky130_fd_sc_hd__fill_4 FILLER_14_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_60 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_70 ();
 sky130_fd_sc_hd__fill_8 FILLER_14_79 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_87 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_89 ();
 sky130_fd_sc_hd__fill_8 FILLER_15_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_15_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_111 ();
 sky130_fd_sc_hd__fill_8 FILLER_15_28 ();
 sky130_fd_sc_hd__fill_4 FILLER_15_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_45 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_59 ();
 sky130_fd_sc_hd__fill_4 FILLER_15_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_65 ();
 sky130_fd_sc_hd__fill_4 FILLER_15_78 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_0 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_109 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_29 ();
 sky130_fd_sc_hd__fill_8 FILLER_16_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_39 ();
 sky130_fd_sc_hd__fill_4 FILLER_16_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_63 ();
 sky130_fd_sc_hd__fill_8 FILLER_16_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_91 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_12 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_18 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_22 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_29 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_41 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_47 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_59 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_61 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_71 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_76 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_17_84 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_93 ();
 sky130_fd_sc_hd__fill_8 FILLER_17_98 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_0 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_10 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_111 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_19 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_27 ();
 sky130_fd_sc_hd__fill_4 FILLER_1_35 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_39 ();
 sky130_fd_sc_hd__fill_8 FILLER_1_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_58 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_72 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_2_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_2 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_25 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_31 ();
 sky130_fd_sc_hd__fill_4 FILLER_2_67 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_87 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_89 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_93 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_0 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_104 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_12 ();
 sky130_fd_sc_hd__fill_4 FILLER_3_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_25 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_39 ();
 sky130_fd_sc_hd__fill_8 FILLER_3_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_59 ();
 sky130_fd_sc_hd__fill_4 FILLER_3_8 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_85 ();
 sky130_fd_sc_hd__fill_8 FILLER_4_0 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_10 ();
 sky130_fd_sc_hd__fill_4 FILLER_4_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_31 ();
 sky130_fd_sc_hd__fill_4 FILLER_4_35 ();
 sky130_fd_sc_hd__fill_8 FILLER_4_42 ();
 sky130_fd_sc_hd__fill_4 FILLER_4_50 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_8 ();
 sky130_fd_sc_hd__fill_8 FILLER_4_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_5_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_32 ();
 sky130_fd_sc_hd__fill_4 FILLER_5_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_58 ();
 sky130_fd_sc_hd__fill_4 FILLER_5_64 ();
 sky130_fd_sc_hd__fill_8 FILLER_5_75 ();
 sky130_fd_sc_hd__fill_8 FILLER_5_83 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_16 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_24 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_31 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_52 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_54 ();
 sky130_fd_sc_hd__fill_4 FILLER_6_64 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_76 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_84 ();
 sky130_fd_sc_hd__fill_8 FILLER_6_98 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_7_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_28 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_36 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_69 ();
 sky130_fd_sc_hd__fill_8 FILLER_7_76 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_84 ();
 sky130_fd_sc_hd__fill_8 FILLER_8_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_14 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_23 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_33 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_45 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_54 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_56 ();
 sky130_fd_sc_hd__fill_4 FILLER_8_64 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_8 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_87 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_89 ();
 sky130_fd_sc_hd__fill_8 FILLER_8_99 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_0 ();
 sky130_fd_sc_hd__fill_4 FILLER_9_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_26 ();
 sky130_fd_sc_hd__fill_4 FILLER_9_33 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_37 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_58 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_8 ();
 sky130_fd_sc_hd__fill_4 FILLER_9_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_90 ();
 sky130_fd_sc_hd__fill_8 FILLER_9_99 ();
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
 sky130_fd_sc_hd__clkinv_1 _120_ (.A(state[2]),
    .Y(_101_));
 sky130_fd_sc_hd__clkinv_1 _121_ (.A(state[1]),
    .Y(_102_));
 sky130_fd_sc_hd__clkinv_1 _122_ (.A(stop_delay),
    .Y(_103_));
 sky130_fd_sc_hd__clkinv_1 _123_ (.A(counter[8]),
    .Y(_104_));
 sky130_fd_sc_hd__clkinv_1 _124_ (.A(counter[7]),
    .Y(_105_));
 sky130_fd_sc_hd__nor2_1 _125_ (.A(state[1]),
    .B(state[0]),
    .Y(_106_));
 sky130_fd_sc_hd__nor3b_1 _126_ (.A(state[1]),
    .B(state[0]),
    .C_N(state[2]),
    .Y(_107_));
 sky130_fd_sc_hd__nand2_1 _127_ (.A(stop_delay),
    .B(_107_),
    .Y(_108_));
 sky130_fd_sc_hd__nor2_1 _128_ (.A(rst),
    .B(_108_),
    .Y(_109_));
 sky130_fd_sc_hd__mux2_1 _129_ (.A0(current_byte[0]),
    .A1(output_data[0]),
    .S(_109_),
    .X(_000_));
 sky130_fd_sc_hd__mux2_1 _130_ (.A0(current_byte[1]),
    .A1(output_data[1]),
    .S(_109_),
    .X(_001_));
 sky130_fd_sc_hd__mux2_1 _131_ (.A0(current_byte[2]),
    .A1(output_data[2]),
    .S(_109_),
    .X(_002_));
 sky130_fd_sc_hd__mux2_1 _132_ (.A0(current_byte[3]),
    .A1(output_data[3]),
    .S(_109_),
    .X(_003_));
 sky130_fd_sc_hd__mux2_1 _133_ (.A0(current_byte[4]),
    .A1(output_data[4]),
    .S(_109_),
    .X(_004_));
 sky130_fd_sc_hd__mux2_1 _134_ (.A0(current_byte[5]),
    .A1(output_data[5]),
    .S(_109_),
    .X(_005_));
 sky130_fd_sc_hd__mux2_1 _135_ (.A0(current_byte[6]),
    .A1(output_data[6]),
    .S(_109_),
    .X(_006_));
 sky130_fd_sc_hd__mux2_1 _136_ (.A0(current_byte[7]),
    .A1(output_data[7]),
    .S(_109_),
    .X(_007_));
 sky130_fd_sc_hd__mux4_2 _137_ (.A0(current_byte[0]),
    .A1(current_byte[1]),
    .A2(current_byte[2]),
    .A3(current_byte[3]),
    .S0(current_bit[0]),
    .S1(current_bit[1]),
    .X(_110_));
 sky130_fd_sc_hd__mux4_2 _138_ (.A0(current_byte[4]),
    .A1(current_byte[5]),
    .A2(current_byte[6]),
    .A3(current_byte[7]),
    .S0(current_bit[0]),
    .S1(current_bit[1]),
    .X(_111_));
 sky130_fd_sc_hd__mux2_1 _139_ (.A0(_110_),
    .A1(_111_),
    .S(current_bit[2]),
    .X(_112_));
 sky130_fd_sc_hd__nor3_1 _140_ (.A(state[2]),
    .B(_102_),
    .C(state[0]),
    .Y(_113_));
 sky130_fd_sc_hd__nor4b_1 _141_ (.A(current_bit[3]),
    .B(state[2]),
    .C(state[0]),
    .D_N(state[1]),
    .Y(_114_));
 sky130_fd_sc_hd__nand2_1 _142_ (.A(current_bit[3]),
    .B(_113_),
    .Y(_115_));
 sky130_fd_sc_hd__a21oi_1 _143_ (.A1(empty),
    .A2(_106_),
    .B1(state[2]),
    .Y(_116_));
 sky130_fd_sc_hd__nand2_1 _144_ (.A(_115_),
    .B(_116_),
    .Y(_117_));
 sky130_fd_sc_hd__or4_1 _145_ (.A(state[2]),
    .B(state[1]),
    .C(state[0]),
    .D(empty),
    .X(_118_));
 sky130_fd_sc_hd__a31oi_1 _146_ (.A1(_101_),
    .A2(state[1]),
    .A3(state[0]),
    .B1(rst),
    .Y(_119_));
 sky130_fd_sc_hd__nand2_1 _147_ (.A(_118_),
    .B(_119_),
    .Y(_031_));
 sky130_fd_sc_hd__a221o_1 _148_ (.A1(_112_),
    .A2(_114_),
    .B1(_117_),
    .B2(tx),
    .C1(_031_),
    .X(_008_));
 sky130_fd_sc_hd__o21ai_0 _149_ (.A1(state[1]),
    .A2(state[0]),
    .B1(read_en),
    .Y(_032_));
 sky130_fd_sc_hd__a21oi_1 _150_ (.A1(_118_),
    .A2(_032_),
    .B1(rst),
    .Y(_009_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _151_ (.A(state[0]),
    .SLEEP(state[2]),
    .X(_033_));
 sky130_fd_sc_hd__nor2_1 _152_ (.A(_114_),
    .B(_033_),
    .Y(_034_));
 sky130_fd_sc_hd__nor3_1 _153_ (.A(_107_),
    .B(_114_),
    .C(_033_),
    .Y(_035_));
 sky130_fd_sc_hd__nor2_1 _154_ (.A(stop_delay),
    .B(_035_),
    .Y(_036_));
 sky130_fd_sc_hd__lpflow_inputiso1p_1 _155_ (.A(stop_delay),
    .SLEEP(_035_),
    .X(_037_));
 sky130_fd_sc_hd__nor2_1 _156_ (.A(counter[0]),
    .B(_037_),
    .Y(_038_));
 sky130_fd_sc_hd__a21oi_1 _157_ (.A1(counter[0]),
    .A2(_035_),
    .B1(_038_),
    .Y(_039_));
 sky130_fd_sc_hd__nor2_1 _158_ (.A(rst),
    .B(_039_),
    .Y(_010_));
 sky130_fd_sc_hd__nand2_1 _159_ (.A(counter[1]),
    .B(_035_),
    .Y(_040_));
 sky130_fd_sc_hd__a21oi_1 _160_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(_037_),
    .Y(_041_));
 sky130_fd_sc_hd__o21ai_0 _161_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(_041_),
    .Y(_042_));
 sky130_fd_sc_hd__a21oi_1 _162_ (.A1(_040_),
    .A2(_042_),
    .B1(rst),
    .Y(_011_));
 sky130_fd_sc_hd__a31oi_1 _163_ (.A1(counter[2]),
    .A2(counter[1]),
    .A3(counter[0]),
    .B1(_037_),
    .Y(_043_));
 sky130_fd_sc_hd__a21oi_1 _164_ (.A1(counter[2]),
    .A2(_035_),
    .B1(_043_),
    .Y(_044_));
 sky130_fd_sc_hd__a21oi_1 _165_ (.A1(counter[1]),
    .A2(counter[0]),
    .B1(counter[2]),
    .Y(_045_));
 sky130_fd_sc_hd__nor3_1 _166_ (.A(rst),
    .B(_044_),
    .C(_045_),
    .Y(_012_));
 sky130_fd_sc_hd__and4_1 _167_ (.A(counter[3]),
    .B(counter[2]),
    .C(counter[1]),
    .D(counter[0]),
    .X(_046_));
 sky130_fd_sc_hd__a2bb2oi_1 _168_ (.A1_N(_046_),
    .A2_N(_037_),
    .B1(_035_),
    .B2(counter[3]),
    .Y(_047_));
 sky130_fd_sc_hd__a31oi_1 _169_ (.A1(counter[2]),
    .A2(counter[1]),
    .A3(counter[0]),
    .B1(counter[3]),
    .Y(_048_));
 sky130_fd_sc_hd__nor3_1 _170_ (.A(rst),
    .B(_047_),
    .C(_048_),
    .Y(_013_));
 sky130_fd_sc_hd__a21oi_1 _171_ (.A1(counter[4]),
    .A2(_046_),
    .B1(_037_),
    .Y(_049_));
 sky130_fd_sc_hd__a21oi_1 _172_ (.A1(counter[4]),
    .A2(_035_),
    .B1(_049_),
    .Y(_050_));
 sky130_fd_sc_hd__nor2_1 _173_ (.A(counter[4]),
    .B(_046_),
    .Y(_051_));
 sky130_fd_sc_hd__nor3_1 _174_ (.A(rst),
    .B(_050_),
    .C(_051_),
    .Y(_014_));
 sky130_fd_sc_hd__a31oi_1 _175_ (.A1(counter[5]),
    .A2(counter[4]),
    .A3(_046_),
    .B1(_037_),
    .Y(_052_));
 sky130_fd_sc_hd__a21oi_1 _176_ (.A1(counter[5]),
    .A2(_035_),
    .B1(_052_),
    .Y(_053_));
 sky130_fd_sc_hd__a21oi_1 _177_ (.A1(counter[4]),
    .A2(_046_),
    .B1(counter[5]),
    .Y(_054_));
 sky130_fd_sc_hd__nor3_1 _178_ (.A(rst),
    .B(_053_),
    .C(_054_),
    .Y(_015_));
 sky130_fd_sc_hd__nand4_1 _179_ (.A(counter[6]),
    .B(counter[5]),
    .C(counter[4]),
    .D(_046_),
    .Y(_055_));
 sky130_fd_sc_hd__a22oi_1 _180_ (.A1(counter[6]),
    .A2(_035_),
    .B1(_036_),
    .B2(_055_),
    .Y(_056_));
 sky130_fd_sc_hd__a31oi_1 _181_ (.A1(counter[5]),
    .A2(counter[4]),
    .A3(_046_),
    .B1(counter[6]),
    .Y(_057_));
 sky130_fd_sc_hd__nor3_1 _182_ (.A(rst),
    .B(_056_),
    .C(_057_),
    .Y(_016_));
 sky130_fd_sc_hd__nor2_1 _183_ (.A(_105_),
    .B(_055_),
    .Y(_058_));
 sky130_fd_sc_hd__nor2_1 _184_ (.A(_037_),
    .B(_058_),
    .Y(_059_));
 sky130_fd_sc_hd__a21oi_1 _185_ (.A1(counter[7]),
    .A2(_035_),
    .B1(_059_),
    .Y(_060_));
 sky130_fd_sc_hd__a211oi_1 _186_ (.A1(_105_),
    .A2(_055_),
    .B1(_060_),
    .C1(rst),
    .Y(_017_));
 sky130_fd_sc_hd__nor3_1 _187_ (.A(_104_),
    .B(_105_),
    .C(_055_),
    .Y(_061_));
 sky130_fd_sc_hd__nor2_1 _188_ (.A(_037_),
    .B(_061_),
    .Y(_062_));
 sky130_fd_sc_hd__a21oi_1 _189_ (.A1(_036_),
    .A2(_058_),
    .B1(counter[8]),
    .Y(_063_));
 sky130_fd_sc_hd__nor2_1 _190_ (.A(_035_),
    .B(_062_),
    .Y(_064_));
 sky130_fd_sc_hd__nor3_1 _191_ (.A(rst),
    .B(_063_),
    .C(_064_),
    .Y(_018_));
 sky130_fd_sc_hd__o21ai_0 _192_ (.A1(_035_),
    .A2(_062_),
    .B1(counter[9]),
    .Y(_065_));
 sky130_fd_sc_hd__nor2_1 _193_ (.A(counter[9]),
    .B(_037_),
    .Y(_066_));
 sky130_fd_sc_hd__nand2_1 _194_ (.A(_061_),
    .B(_066_),
    .Y(_067_));
 sky130_fd_sc_hd__a21oi_1 _195_ (.A1(_065_),
    .A2(_067_),
    .B1(rst),
    .Y(_019_));
 sky130_fd_sc_hd__a31oi_1 _196_ (.A1(counter[10]),
    .A2(counter[9]),
    .A3(_061_),
    .B1(_037_),
    .Y(_068_));
 sky130_fd_sc_hd__a21oi_1 _197_ (.A1(counter[10]),
    .A2(_035_),
    .B1(_068_),
    .Y(_069_));
 sky130_fd_sc_hd__a21oi_1 _198_ (.A1(counter[9]),
    .A2(_061_),
    .B1(counter[10]),
    .Y(_070_));
 sky130_fd_sc_hd__nor3_1 _199_ (.A(rst),
    .B(_069_),
    .C(_070_),
    .Y(_020_));
 sky130_fd_sc_hd__nand4_1 _200_ (.A(counter[11]),
    .B(counter[10]),
    .C(counter[9]),
    .D(_061_),
    .Y(_071_));
 sky130_fd_sc_hd__a41oi_1 _201_ (.A1(counter[11]),
    .A2(counter[10]),
    .A3(counter[9]),
    .A4(_061_),
    .B1(_037_),
    .Y(_072_));
 sky130_fd_sc_hd__a41oi_1 _202_ (.A1(counter[10]),
    .A2(counter[9]),
    .A3(_036_),
    .A4(_061_),
    .B1(counter[11]),
    .Y(_073_));
 sky130_fd_sc_hd__nor2_1 _203_ (.A(_035_),
    .B(_072_),
    .Y(_074_));
 sky130_fd_sc_hd__nor3_1 _204_ (.A(rst),
    .B(_073_),
    .C(_074_),
    .Y(_021_));
 sky130_fd_sc_hd__o21ai_0 _205_ (.A1(_035_),
    .A2(_072_),
    .B1(counter[12]),
    .Y(_075_));
 sky130_fd_sc_hd__or3_1 _206_ (.A(counter[12]),
    .B(_037_),
    .C(_071_),
    .X(_076_));
 sky130_fd_sc_hd__a21oi_1 _207_ (.A1(_075_),
    .A2(_076_),
    .B1(rst),
    .Y(_022_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _208_ (.A(counter[4]),
    .SLEEP(counter[5]),
    .X(_077_));
 sky130_fd_sc_hd__nor4b_1 _209_ (.A(counter[11]),
    .B(counter[1]),
    .C(counter[0]),
    .D_N(counter[12]),
    .Y(_078_));
 sky130_fd_sc_hd__nand4_1 _210_ (.A(counter[10]),
    .B(counter[6]),
    .C(_077_),
    .D(_078_),
    .Y(_079_));
 sky130_fd_sc_hd__nor4b_1 _211_ (.A(counter[5]),
    .B(counter[4]),
    .C(counter[0]),
    .D_N(counter[1]),
    .Y(_080_));
 sky130_fd_sc_hd__nor4_1 _212_ (.A(counter[12]),
    .B(counter[11]),
    .C(counter[10]),
    .D(counter[6]),
    .Y(_081_));
 sky130_fd_sc_hd__nand3_1 _213_ (.A(_107_),
    .B(_080_),
    .C(_081_),
    .Y(_082_));
 sky130_fd_sc_hd__o21ai_0 _214_ (.A1(_034_),
    .A2(_079_),
    .B1(_082_),
    .Y(_083_));
 sky130_fd_sc_hd__nor2_1 _215_ (.A(stop_delay),
    .B(counter[9]),
    .Y(_084_));
 sky130_fd_sc_hd__nor4b_1 _216_ (.A(counter[8]),
    .B(counter[7]),
    .C(counter[2]),
    .D_N(counter[3]),
    .Y(_085_));
 sky130_fd_sc_hd__a32oi_1 _217_ (.A1(_083_),
    .A2(_084_),
    .A3(_085_),
    .B1(_035_),
    .B2(stop_delay),
    .Y(_086_));
 sky130_fd_sc_hd__nor2_1 _218_ (.A(rst),
    .B(_086_),
    .Y(_023_));
 sky130_fd_sc_hd__o21ai_0 _219_ (.A1(state[2]),
    .A2(_103_),
    .B1(state[0]),
    .Y(_087_));
 sky130_fd_sc_hd__a31oi_1 _220_ (.A1(_108_),
    .A2(_115_),
    .A3(_087_),
    .B1(rst),
    .Y(_024_));
 sky130_fd_sc_hd__a31oi_1 _221_ (.A1(_101_),
    .A2(state[0]),
    .A3(stop_delay),
    .B1(_102_),
    .Y(_088_));
 sky130_fd_sc_hd__a31oi_1 _222_ (.A1(_102_),
    .A2(stop_delay),
    .A3(_033_),
    .B1(_088_),
    .Y(_089_));
 sky130_fd_sc_hd__nor2_1 _223_ (.A(rst),
    .B(_089_),
    .Y(_025_));
 sky130_fd_sc_hd__o31ai_1 _224_ (.A1(state[1]),
    .A2(state[0]),
    .A3(_103_),
    .B1(state[2]),
    .Y(_090_));
 sky130_fd_sc_hd__a21oi_1 _225_ (.A1(_118_),
    .A2(_090_),
    .B1(rst),
    .Y(_026_));
 sky130_fd_sc_hd__o21ai_0 _226_ (.A1(current_bit[3]),
    .A2(stop_delay),
    .B1(_113_),
    .Y(_091_));
 sky130_fd_sc_hd__and2_0 _227_ (.A(stop_delay),
    .B(_114_),
    .X(_092_));
 sky130_fd_sc_hd__mux2i_1 _228_ (.A0(_092_),
    .A1(_091_),
    .S(current_bit[0]),
    .Y(_093_));
 sky130_fd_sc_hd__nor2_1 _229_ (.A(rst),
    .B(_093_),
    .Y(_027_));
 sky130_fd_sc_hd__xor2_1 _230_ (.A(current_bit[1]),
    .B(current_bit[0]),
    .X(_094_));
 sky130_fd_sc_hd__a22oi_1 _231_ (.A1(current_bit[1]),
    .A2(_091_),
    .B1(_092_),
    .B2(_094_),
    .Y(_095_));
 sky130_fd_sc_hd__nor2_1 _232_ (.A(rst),
    .B(_095_),
    .Y(_028_));
 sky130_fd_sc_hd__nand3_1 _233_ (.A(current_bit[2]),
    .B(current_bit[1]),
    .C(current_bit[0]),
    .Y(_096_));
 sky130_fd_sc_hd__a22oi_1 _234_ (.A1(current_bit[2]),
    .A2(_091_),
    .B1(_092_),
    .B2(_096_),
    .Y(_097_));
 sky130_fd_sc_hd__a21oi_1 _235_ (.A1(current_bit[1]),
    .A2(current_bit[0]),
    .B1(current_bit[2]),
    .Y(_098_));
 sky130_fd_sc_hd__nor3_1 _236_ (.A(rst),
    .B(_097_),
    .C(_098_),
    .Y(_029_));
 sky130_fd_sc_hd__nand2_1 _237_ (.A(current_bit[3]),
    .B(_091_),
    .Y(_099_));
 sky130_fd_sc_hd__nand4_1 _238_ (.A(current_bit[2]),
    .B(current_bit[1]),
    .C(current_bit[0]),
    .D(_092_),
    .Y(_100_));
 sky130_fd_sc_hd__a21oi_1 _239_ (.A1(_099_),
    .A2(_100_),
    .B1(rst),
    .Y(_030_));
 sky130_fd_sc_hd__dfxtp_1 _240_ (.CLK(clknet_2_1__leaf_clk),
    .D(_000_),
    .Q(current_byte[0]));
 sky130_fd_sc_hd__dfxtp_1 _241_ (.CLK(clknet_2_1__leaf_clk),
    .D(_001_),
    .Q(current_byte[1]));
 sky130_fd_sc_hd__dfxtp_1 _242_ (.CLK(clknet_2_1__leaf_clk),
    .D(_002_),
    .Q(current_byte[2]));
 sky130_fd_sc_hd__dfxtp_1 _243_ (.CLK(clknet_2_1__leaf_clk),
    .D(_003_),
    .Q(current_byte[3]));
 sky130_fd_sc_hd__dfxtp_1 _244_ (.CLK(clknet_2_0__leaf_clk),
    .D(_004_),
    .Q(current_byte[4]));
 sky130_fd_sc_hd__dfxtp_1 _245_ (.CLK(clknet_2_1__leaf_clk),
    .D(_005_),
    .Q(current_byte[5]));
 sky130_fd_sc_hd__dfxtp_1 _246_ (.CLK(clknet_2_0__leaf_clk),
    .D(_006_),
    .Q(current_byte[6]));
 sky130_fd_sc_hd__dfxtp_1 _247_ (.CLK(clknet_2_1__leaf_clk),
    .D(_007_),
    .Q(current_byte[7]));
 sky130_fd_sc_hd__dfxtp_1 _248_ (.CLK(clknet_2_0__leaf_clk),
    .D(_008_),
    .Q(tx));
 sky130_fd_sc_hd__dfxtp_1 _249_ (.CLK(clknet_2_0__leaf_clk),
    .D(_009_),
    .Q(read_en));
 sky130_fd_sc_hd__dfxtp_1 _250_ (.CLK(clknet_2_2__leaf_clk),
    .D(_010_),
    .Q(counter[0]));
 sky130_fd_sc_hd__dfxtp_1 _251_ (.CLK(clknet_2_2__leaf_clk),
    .D(_011_),
    .Q(counter[1]));
 sky130_fd_sc_hd__dfxtp_1 _252_ (.CLK(clknet_2_2__leaf_clk),
    .D(_012_),
    .Q(counter[2]));
 sky130_fd_sc_hd__dfxtp_1 _253_ (.CLK(clknet_2_2__leaf_clk),
    .D(_013_),
    .Q(counter[3]));
 sky130_fd_sc_hd__dfxtp_1 _254_ (.CLK(clknet_2_2__leaf_clk),
    .D(_014_),
    .Q(counter[4]));
 sky130_fd_sc_hd__dfxtp_1 _255_ (.CLK(clknet_2_2__leaf_clk),
    .D(_015_),
    .Q(counter[5]));
 sky130_fd_sc_hd__dfxtp_1 _256_ (.CLK(clknet_2_2__leaf_clk),
    .D(_016_),
    .Q(counter[6]));
 sky130_fd_sc_hd__dfxtp_1 _257_ (.CLK(clknet_2_3__leaf_clk),
    .D(_017_),
    .Q(counter[7]));
 sky130_fd_sc_hd__dfxtp_1 _258_ (.CLK(clknet_2_3__leaf_clk),
    .D(_018_),
    .Q(counter[8]));
 sky130_fd_sc_hd__dfxtp_1 _259_ (.CLK(clknet_2_3__leaf_clk),
    .D(_019_),
    .Q(counter[9]));
 sky130_fd_sc_hd__dfxtp_1 _260_ (.CLK(clknet_2_3__leaf_clk),
    .D(_020_),
    .Q(counter[10]));
 sky130_fd_sc_hd__dfxtp_1 _261_ (.CLK(clknet_2_3__leaf_clk),
    .D(_021_),
    .Q(counter[11]));
 sky130_fd_sc_hd__dfxtp_1 _262_ (.CLK(clknet_2_3__leaf_clk),
    .D(_022_),
    .Q(counter[12]));
 sky130_fd_sc_hd__dfxtp_1 _263_ (.CLK(clknet_2_3__leaf_clk),
    .D(_023_),
    .Q(stop_delay));
 sky130_fd_sc_hd__dfxtp_1 _264_ (.CLK(clknet_2_0__leaf_clk),
    .D(_024_),
    .Q(state[0]));
 sky130_fd_sc_hd__dfxtp_1 _265_ (.CLK(clknet_2_0__leaf_clk),
    .D(_025_),
    .Q(state[1]));
 sky130_fd_sc_hd__dfxtp_1 _266_ (.CLK(clknet_2_0__leaf_clk),
    .D(_026_),
    .Q(state[2]));
 sky130_fd_sc_hd__dfxtp_1 _267_ (.CLK(clknet_2_1__leaf_clk),
    .D(_027_),
    .Q(current_bit[0]));
 sky130_fd_sc_hd__dfxtp_1 _268_ (.CLK(clknet_2_3__leaf_clk),
    .D(_028_),
    .Q(current_bit[1]));
 sky130_fd_sc_hd__dfxtp_1 _269_ (.CLK(clknet_2_1__leaf_clk),
    .D(_029_),
    .Q(current_bit[2]));
 sky130_fd_sc_hd__dfxtp_1 _270_ (.CLK(clknet_2_0__leaf_clk),
    .D(_030_),
    .Q(current_bit[3]));
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
 sky130_fd_sc_hd__clkbuf_1 clkload0 (.A(clknet_2_2__leaf_clk));
endmodule
