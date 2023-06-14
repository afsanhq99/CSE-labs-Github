module project(A,B,C,opcode,clk,ZF,SF,CF);
	input [3:0]A,B;
	input [2:0]opcode;
	input clk;
	
	reg [1:0]sum = 0,count = 0;
	reg [3:0] A2s, B2s;
	reg car = 0,take = 0;

	output reg [3:0]C;
	output reg ZF=0,SF=0,CF=0;
	
	always @(posedge clk)
		begin
			case(opcode)
			3'b000: //RESET
			begin
				count=0;car=0;sum=0;C=0;CF=0;take=0;
			end
			
			3'b001: ///NAND
			begin
				if(count==0)
					begin
						C[0]=~(A[0] & B[0]);
						count=1;
					end
				else if(count==1)
					begin
						C[1]=~(A[1] & B[1]);
						count=2;
					end
				else if(count==2)
					begin
						C[2]=~(A[2] & B[2]);
						count=3;
					end
				else if(count==3)
					begin
						C[3]=~(A[3] & B[3]);
						count=0;
					end
			end
			
			
			
			
			3'b010: //ADD
				begin
					if(count==0)
						begin
							sum=(A[0]+B[0]);
							car=sum[1];
							C[0]=sum[0];
							count=1;
						end
					else if(count==1)
						begin
							sum=(A[1]+B[1]+car);
							C[1]=sum[0];
							car=sum[1];
							count=2;
						end
					else if(count==2)
						begin
							sum=(A[2]+B[2]+car);
							C[2]=sum[0];
							car=sum[1];
							count=3;
						end
					else if(count==3)
						begin
							sum=(A[3]+B[3]+car);
							C[3]=sum[0];
							car=sum[1];
							count=0;
							CF = car==1;
						end
				end
				
				
			3'b011: //AND
			begin
				if(count==0)
					begin
						C[0]= A[0] | B[0];
						count=1;
					end
				else if(count==1)
					begin
						C[1]=A[1] | B[1];
						count=2;
					end
				else if(count==2)
					begin
						C[2]=A[2] | B[2];
						count=3;
					end
				else if(count==3)
					begin
						C[3]=A[3] | B[3];
						count=0;
					end
			end

			3'b100: //SUB
				begin
					B2s=-B; 
					A2s=-A;
					if(count==0)
						begin
							sum=(A[0]+B2s[0]);
							car=sum[1];
							C[0]=sum[0];
							count=1;
							if(A[0]==0 && B[0]==1)
								begin
									take=1;
								end
						end
					else if(count==1)
					begin
						sum=(A[1]+B2s[1]+car);
						C[1]=sum[0];
						car=sum[1];
						count=2;
						if(take==1)
							begin
								if(A[1]==1 && B[1]==0)
									begin
										take=0;
									end
							end
						else
						begin
							if(A[1]==0 && B[1]==1)
								begin
									take=1;
								end
						end
					end
					else if(count==2)
					begin
						sum=(A[2]+B2s[2]+car);
						C[2]=sum[0];
						car=sum[1];
						count=3;
						if(take==1)
							begin
								if(A[2]==1 && B[2]==0)
									begin
										take=0;
									end
							end
						else
							begin
								if(A[2]==0 && B[2]==1)
									begin
										take=1;
									end
							end
					end
					else if(count==3)
					begin
						sum=(A[3]+B2s[3]+car);
						C[3]=sum[0];
						car=sum[1];
						count=0;
						if(take==1)
							begin
								if(A[3]==1 && B[3]==0)
									begin
										take=0;
									end
							end
						else
							begin
								if(A[3]==0 && B[3]==1)
									begin
										take=1;
									end
							end
						CF = take == 1;
					end
				end
		endcase
	end
	always @(C)
		begin
			SF = C[3]==1'b1;
			ZF = C==4'b0000;
		end
endmodule