// First version: select one philosopher and execute its step.
// If the philosopher is hungry and both forks are available, it starts eating.
// If it is eating, it may become not hungry and stop eating.
// If the philosopher is not hungry, it does nothing.

asm philosophers_signatureAndRules

import ../STDL/StandardLibrary
export *

//declare universes and functions
signature:
	// Agents
	domain PhilosophersID subsetof Integer
	domain ForkID subsetof Integer

	//functions for Agent Philosophers
	controlled hungry: PhilosophersID -> Boolean
	controlled eating: PhilosophersID -> Boolean
	derived right_fork: PhilosophersID -> ForkID
	derived left_fork: PhilosophersID -> ForkID
    controlled owner: ForkID -> PhilosophersID //records the current exclusive user of a given resource
    
	static last_fork: ForkID
	static first_philosofer: PhilosophersID
	
definitions:
	domain PhilosophersID = {1 : 200}
	domain ForkID =         {1 : 200}
	function last_fork =         200
	function first_philosofer = 1
	
	
	
	function left_fork($a in PhilosophersID) =	$a // this in an optimization, if we wanted to be semantically correct we would need id($p) with id defined from PhilosophersID to Ids as $p
			

	function right_fork($b in PhilosophersID) =
		if $b = first_philosofer then
			last_fork
		else
			$b - 1 // this in an optimization, if we wanted to be semantically correct we would need id($p)-1 with id defined from PhilosophersID to Ids as $p
		endif

	//Rules

	macro rule r_Eat($p in PhilosophersID) =
		if (hungry($p)) then
			if eating($p) = true then
				choose $didIeatEnought in Boolean with true do
					if $didIeatEnought = true then
						hungry($p) := false
					endif
			else
				if( isUndef(owner(left_fork($p))) and isUndef(owner(right_fork($p))) ) then
					par
						owner(left_fork($p)) := $p
						owner(right_fork($p)) := $p
						eating($p) := true
					endpar
				endif
			endif
		endif

	macro rule r_Think($p in PhilosophersID) =
		if ( not hungry($p)) then
			if eating($p) and (owner(left_fork($p)) = $p) and (owner(right_fork($p)) = $p) then
				par
					owner(left_fork($p)) := undef
					owner(right_fork($p)) := undef
					eating($p) := false
				endpar
			endif
		endif

	macro rule r_Philo($p in PhilosophersID) = 
		par	
			r_Eat[$p]
			r_Think[$p]
		endpar
		
		
		
