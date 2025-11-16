module Mixing {
    ///////// ADC /////////
    inout              ADC_CS_N,
    output             ADC_DIN,
    input              ADC_DOUT,
    output             ADC_SCLK,

    ///////// ADC /////////
    input              AUD_ADCDAT,
    inout              AUD_ADCLRCK,
    inout              AUD_BCLK,
    output             AUD_DACDAT,
    inout              AUD_DACLRCK,
    output             AUD_XCK,

    ///////// clocks /////////
    input              clock2_50,
    input              clock3_50,
    input              clock4_50,
    input              clock_50,

    ///////// HEX /////////
    output      [6:0]  HEX0,
    output      [6:0]  HEX1,
    output      [6:0]  HEX2,
    output      [6:0]  HEX3,
    output      [6:0]  HEX4,
    output      [6:0]  HEX5,

    ///////// FOO /////////
    output      [2]    FOO,
}