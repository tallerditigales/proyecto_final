/* Quartus Prime Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("/home/alejandro/projects/taller_digitales/proyecto_final/ARM_UNICICLO/output_files/") File("ARM_SINGLE_CYCLE.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
