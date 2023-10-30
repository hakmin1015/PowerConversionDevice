
#------------------------------------------------------------------------------
# Project 'Flicker_model_Vctrl' make using the 'Intel(R) Visual Fortran Compiler XE 12.1.5.344' compiler.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# All project
#------------------------------------------------------------------------------

all: targets
	@echo !--Make: succeeded.



#------------------------------------------------------------------------------
# Directories, Platform, and Version
#------------------------------------------------------------------------------

Arch        = windows
EmtdcDir    = C:\Program Files (x86)\PSCAD50\emtdc\if12
EmtdcInc    = $(EmtdcDir)\inc
EmtdcBin    = $(EmtdcDir)\$(Arch)
EmtdcMain   = $(EmtdcBin)\main.obj
EmtdcLib    = $(EmtdcBin)\emtdc.lib
SolverLib    = $(EmtdcBin)\Solver.lib


#------------------------------------------------------------------------------
# Fortran Compiler
#------------------------------------------------------------------------------

FC_Name         = ifort.exe
FC_Suffix       = obj
FC_Args         = /nologo /c /free /real_size:64 /fpconstant /warn:declarations /iface:default /align:dcommons /fpe:0
FC_Debug        =  /O2
FC_Preprocess   = 
FC_Preproswitch = 
FC_Warn         = 
FC_Checks       = 
FC_Includes     = /include:"$(EmtdcInc)" /include:"$(EmtdcDir)" /include:"$(EmtdcBin)"
FC_Compile      = $(FC_Name) $(FC_Args) $(FC_Includes) $(FC_Debug) $(FC_Warn) $(FC_Checks)

#------------------------------------------------------------------------------
# C Compiler
#------------------------------------------------------------------------------

CC_Name     = cl.exe
CC_Suffix   = obj
CC_Args     = /nologo /MT /W3 /EHsc /c
CC_Debug    =  /O2
CC_Includes = 
CC_Compile  = $(CC_Name) $(CC_Args) $(CC_Includes) $(CC_Debug)

#------------------------------------------------------------------------------
# Linker
#------------------------------------------------------------------------------

Link_Name   = link.exe
Link_Debug  = 
Link_Args   = /out:$@ /nologo /nodefaultlib:libc.lib /nodefaultlib:libcmtd.lib /subsystem:console
Link        = $(Link_Name) $(Link_Args) $(Link_Debug)

#------------------------------------------------------------------------------
# Build rules for generated files
#------------------------------------------------------------------------------


.f.$(FC_Suffix):
	@echo !--Compile: $<
	$(FC_Compile) $<



.c.$(CC_Suffix):
	@echo !--Compile: $<
	$(CC_Compile) $<



#------------------------------------------------------------------------------
# Build rules for file references
#------------------------------------------------------------------------------


eaf_library_1.lib: 
	@echo !--Copy: "C:\Users\Supercom\_ ____\-SMU Lecture-\2022-2 [___] 3 ________\[Lecture3] Arc-Furnace\ArcFurnace\lib\if12\eaf_library.lib"
	copy "C:\Users\Supercom\_ ____\-SMU Lecture-\2022-2 [___] 3 ________\[Lecture3] Arc-Furnace\ArcFurnace\lib\if12\eaf_library.lib" "eaf_library_1.lib"

#------------------------------------------------------------------------------
# Dependencies
#------------------------------------------------------------------------------


FC_Objects = \
 Station.$(FC_Suffix) \
 Main.$(FC_Suffix) \
 EAF_Facility.$(FC_Suffix) \
 LCL_Filter.$(FC_Suffix) \
 Rectifier_Controls.$(FC_Suffix) \
 Rectifier.$(FC_Suffix)

FC_ObjectsLong = \
 "Station.$(FC_Suffix)" \
 "Main.$(FC_Suffix)" \
 "EAF_Facility.$(FC_Suffix)" \
 "LCL_Filter.$(FC_Suffix)" \
 "Rectifier_Controls.$(FC_Suffix)" \
 "Rectifier.$(FC_Suffix)"

CC_Objects =

CC_ObjectsLong =

LK_Objects = \
  eaf_library_1.lib

LK_ObjectsLong = \
  "eaf_library_1.lib"

SysLibs  = wsock32.lib

Binary   = Flicker_model_Vctrl.exe

$(Binary): $(FC_Objects) $(CC_Objects) $(LK_Objects) 
	@echo !--Link: $@
	$(Link) "$(EmtdcMain)" $(FC_ObjectsLong) $(CC_ObjectsLong) $(LK_ObjectsLong) "$(EmtdcLib)" "$(SolverLib)" $(SysLibs)

targets: $(Binary)


clean:
	-del EMTDC_V*
	-del *.obj
	-del *.o
	-del *.exe
	@echo !--Make clean: succeeded.



