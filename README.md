# FIFO
A FIFO RTL design to learn how to write a test using SystemVerilog
FIFO module spec
+ DIN[W-1:0], DOUT[W-1:0]: Data to be written and output read data, respectively 
• WEn: Write Enable instructs the FIFO to write the data on DIN to the next available location in the register array if sufficient space will be available. Note the user can assert this signal even when sufficient space will not be available and your FIFO logic must NOT write/update the register array in that case (i.e. Don't assume the user will only assert this signal under appropriate conditions.) 
• REn: Read Enable indicates that the consumer is about to consume the data on DOUT and the FIFO can eventually overwrite the current data item and begin to output the next available data on the next clock edge. 
• Full: Indicates the FIFO is currently full 
• Empty: Indicates the FIFO is currently empty 
• RST: Active-high reset signal 
Read & Write Pointers: You should access the register array using two pointers/addresses: 1- RP (Read Pointer), 2- WP (Write Pointer). RP points to the next item to be read from the memory array. WP points to the next location to be written to the memory array. Initially, both pointers start at 0. After a successful Write or Read(triggered by the user asserting WEn or REn and sufficient conditions exist to carry-out the operation), the respective pointers should increment, wrapping to 0 after the last location. 
Full & Empty Conditions: One complicating issue is to decipher when your FIFO is empty or full. Both conditions occur when WP = RP. For example, WP=RP=0 initially when the FIFO is empty. But if you wrote values to the FIFO, completely filling it, then WP would wrap back to 0 while RP would not have changed from 0. Thus WP=RP is an insufficient condition to decipher when the FIFO is empty or full. While several strategies exist to distinguish whether the FIFO is full or empty when RP=WP (some of which require only minimal additional logic), we suggest that you simply keep track of the number of items in your FIFO as a separate counter value and assert the Full and Empty signals appropriately using this counter value. 
Sufficient Write and Read Conditions: When the FIFO is full, producer should no longer be allowed to write into the FIFO even if WEn is asserted. Similarly, when the FIFO is empty, an asserted REn signal should be disregarded. 
Reset: When reset, initialize the necessary control logic, but we do not generally initialize the register array contents since they must be written with good data before a user can legally read any data. 
Verilog Considerations: We want our FIFO design to work for any number of locations (DEPTH) and bit-width (WIDTH). To do this we can declare certain "generic parameters" (not actual physical inputs/outputs but "meta-inputs" that determine what FIFO logic is generated). In Verilog these are known as "parameters" while in VHDL they are known as "generics". Parameters can be specified when the module is instantiated and are used to create a different version of the code. In our FIFO we make the WIDTH and DEPTH parameters, in that order. Thus we can instantiate an 8-bit, 4-deep FIFO as: 
soc_fifo #(8, 4) fifo4x8(clk, rst, din, wen, ren, dout, full, empty); 
A 16-bit, 6-deep FIFO can be instantiated as: 
soc_fifo #(16, 6) fifo6x16(clk, rst, din, wen, ren, dout, full, empty);
