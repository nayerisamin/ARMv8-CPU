`default_nettype none
	module CPU();
	wire Clk;
	wire[63:0] 	pc_result,//Program Counter Output
			rb_out1,rb_out2,//Register Bank Outputs
			rb_alu_mux,//Output Of Register Bank To ALU Multiplexer
			alu_result,//Output of ALU
			dm_out,//Output of Data Memory
			dm_rb_mux,//Output Of Data Memory To Register Bank Multiplexer
			se_out,//Sign Extension Output
			ls_out,//Left Shift Output
			pc_adder_res,old_pc,//Program Counter Next-Instruction Adder Output
			adder_pc_mux_out,//Adder To Program Counter Multiplexer Output
			shift_adder_res;//Shift Adder Result

	wire[31:0]	instruction;//Output Of Instruction Memory


	wire[4:0]	im_regbank_mux_out;//Output of Instruction Memory Multiplexer

	wire 	z, //Zero Bit of ALU
		cu_opcode, cu_reg2loc, cu_alusrc, cu_memtoreg, cu_regwrite, cu_memread, cu_memwrite, cu_branch,pc_write,pc_reset;//Control Unit Wires
	
	wire[1:0] cu_aluop;//Control Unit ALUOp Wire

	wire[3:0] aluc_op;//ALU Controller Output
	//CLK
	clock clk(Clk);
	
	//Program Counter Connections
	pc PC(Clk , pc_reset,pc_write, adder_pc_mux_out, old_pc );

	//Instruction Memory Connections
	InstructionMemory IM(old_pc, instruction);

	//Instruction Memory To Resgister Bank Multiplexer Connections
	MUX(.n(5)) IMToRegisterBankMux(instruction[20:16], instruction[4:0], cu_reg2loc, im_regbank_mux_out);

	//Register Bank Connections
	RegBank RB(instruction[9:5], im_regbank_mux_out, instruction[4:0], dm_rb_mux, cu_regwrite, Clk, rb_out1, rb_out2);

	//Register Bank to ALU Multiplexer Connections
	MUX RBToALUMux(rb_out2, se_out, cu_alusrc, rb_alu_mux);

	//ALU Connections
	ALU Alu(rb_out1 , rb_alu_mux, aluc_op, z,alu_result);

	//Data Memory Connection
	DataMemory datamem(alu_result, rb_out2, Clk, cu_memwrite, cu_memread, dm_out);

	//Data Memory To Register Bank Multiplexer
	MUX DMToRBMux(dm_out, alu_result, cu_memtoreg ,dm_rb_mux);

	//Sign Extension Connections
	SignExtend SE(instruction, se_out);

	//Shift Left Connections
	ShiftUnit LS(se_out, ls_out);

	//Program Counter Next-Instruction Adder connections
	Adder PCAdder(old_pc,64'b100, pc_adder_res);

	//Adder To Program Counter Multiplexer Connections
	MUX AddToPCMux(pc_adder_res, shift_adder_res, cu_branch&z, adder_pc_mux_out);

	//Shift Adder Connections
	Adder ShiftAdder(pc_result, ls_out, 64'b0000000000000000000000000000000000000000000000000000000000000100, shift_adder_res);

	//Control Unit Connections
	Control CU(cu_opcode, cu_reg2loc, cu_alusrc, cu_memtoreg, cu_regwrite, cu_memread, cu_memwrite, cu_branch, cu_aluop, Clk);

	//ALU Controller Connections
	ALUControl ALUC(cu_aluop, instruction[31:21], aluc_op);
	
	
endmodule
