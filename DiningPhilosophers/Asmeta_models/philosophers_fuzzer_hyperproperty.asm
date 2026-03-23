asm philosophers_fuzzer_hyperproperty

import ../STDL/StandardLibrary
import philosophers_signatureAndRules

//declare universes and functions
signature:
	// To measure some observed behavior of the simulated model
	// these are useful for model analysis or to check hyperproperties
	controlled consumption: PhilosophersID -> Integer 
	// ------- SIMULATION SIGNATURE --------------- 
	controlled steps: Integer
	controlled run: Integer
	controlled exitError: Integer
	derived hyperproperty: Boolean
	derived isRunTerminated: Boolean
	static maxRun: Integer
	static maxStep: Integer
	
definitions:
	// FUNCTION DEFINITIONS
	// Setup has been tested with 5 philosophers. Using more philosophers may require increasing `maxRun` and `maxStep`. 
	// For significance reasons, a higher limit may also be needed in the hyperproperty precondition check (`run > 250`).
	function maxRun = 500
	function maxStep = 150
	function isRunTerminated = (steps>=maxStep)
	function hyperproperty = ( run > 250 implies (exist $phil1 in PhilosophersID with (exist $phil2 in PhilosophersID with 100*consumption($phil1)>110*consumption($phil2)))) 
	
	rule r_measureHPs = // count how much each philosopher ate
		forall $phil in PhilosophersID with eating($phil) = true do consumption($phil) := consumption($phil) + 1
	
	rule r_reinitializeSimulatedModel = par
		forall $p in PhilosophersID do hungry($p) := true
		forall $q in PhilosophersID do eating($q) := false
		forall $f in ForkID do owner($f) := undef   
		steps := 0
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
		else if exitError != 0 then	skip
		else if not(hyperproperty) then
			exitError := -1
		else if not(isRunTerminated) then 
			par
				r_measureHPs[]
				r_simulatedMain[]
				steps := steps + 1
			endpar
		else if run < maxRun then
			par
				r_measureHPs[]
				run := run + 1
				r_reinitializeSimulatedModel[]
			endpar
		endif endif endif endif endif


default init initial_state:
	// it saves statistics on simulations for model analysis or to check hyperproperties
	function consumption($p in PhilosophersID) = 0
	
	// -------- SIMULATOR INIZIALIZATION ------------------
	function steps = -1      
	function exitError = 0      
	function run = 1

		
		
		