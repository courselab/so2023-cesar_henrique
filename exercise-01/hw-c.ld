OUTPUT_FORMAT(binary)
SECTIONS
{
	. = 0x7c00;
	.text :
	{
		*(.text)
		*(.rodata)
	}	
	. = 0x7c00 + 510;
	.signature :
	{
		BYTE(0x55)
		BYTE(0xAA)
	} 	
	__END_STACK__ = 0x8200;	
}
STARTUP(hw-c_rt0.o);
INPUT(hw-c_utils.o)
