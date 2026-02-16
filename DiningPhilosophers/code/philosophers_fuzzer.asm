asm philosophers_fuzzer

import ../STDL/StandardLibrary
import philosophers_signatureAndRules

//declare universes and functions
signature:
	controlled steps: Integer
	controlled exitError: Integer
	derived inv: Boolean
	
definitions:
	function inv = (exist $phil in PhilosophersID with hungry($phil)=true) 
	
	rule r_reinitializeSimulatedModel = par
		forall $p in PhilosophersID do hungry($p) := true
		forall $q in PhilosophersID do eating($q) := false
		forall $f in ForkID do owner($f) := undef   
	endpar
	
	rule r_simulatedMain = // choose one agent and run it
		choose $p in PhilosophersID with true do
			r_Philo[$p]
	
	main rule r_fuzzer =
		if steps = -1 then
			par
				r_reinitializeSimulatedModel[]
				steps := steps + 1
			endpar
		else if not(inv) then
			exitError := 1
		else
			par
				r_simulatedMain[]
				steps := steps + 1
			endpar
		endif endif


default init initial_state:
	function steps = -1      
	function exitError = 0           

		
		
		