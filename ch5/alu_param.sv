// File: alu_param.sv
module alu_param #(
    parameter int WIDTH = 8 // Reusable word width parameter
)(
    input  logic [WIDTH-1:0]  A,
    input  logic [WIDTH-1:0]  B,
    input  logic [2:0]        Op,     // 3-bit Opcode selector
    output logic [WIDTH-1:0]  Result,
    output logic              Zero,   // Z flag: High if Result is all zeros
    output logic              Carry,  // C flag: Unsigned carry-out/borrow
    output logic              Overflow, // V flag: Signed arithmetic overflow
    output logic              Negative  // N flag: Result is negative (MSB)
);
    logic [WIDTH:0] ALU_Math; // Extended bit internal wire for carry capture

    always_comb begin
        Result   = '0;
        ALU_Math = '0;
        Carry    = 1'b0;
        Overflow = 1'b0;

        case (Op)
            // Opcode 000: Unsigned/Signed Addition
            3'b000:  begin 
                ALU_Math = A + B; 
                Result   = ALU_Math[WIDTH-1:0]; 
                Carry    = ALU_Math[WIDTH];
                // V triggers if inputs have same sign but result sign differs
                Overflow = (A[WIDTH-1] == B[WIDTH-1]) && (Result[WIDTH-1] != A[WIDTH-1]);
            end
            
            // Opcode 001: Unsigned/Signed Subtraction
            3'b001:  begin 
                ALU_Math = A - B; 
                Result   = ALU_Math[WIDTH-1:0]; 
                Carry    = ALU_Math[WIDTH];
                // V triggers if operands have opposite signs and result sign changes
                Overflow = (A[WIDTH-1] != B[WIDTH-1]) && (Result[WIDTH-1] != A[WIDTH-1]);
            end
            
            // Logical Bitwise Operations
            3'b010:  Result = A & B;
            3'b011:  Result = A | B;
            3'b100:  Result = A ^ B;
            3'b101:  Result = ~A;
            
            // Shift Operations
            3'b110:  Result = A << 1;
            3'b111:  Result = A >> 1;
            default: Result = '0;
        endcase
        
        // Continuous verification for the global status flags
        Zero     = (Result == '0);
        Negative = Result[WIDTH-1]; // Sampling the MSB position
    end
endmodule