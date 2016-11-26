pragma solidity ^0.4.0;

///Created by Lauri Johannes Miettinen in fall 2016.

//Screw you, Notepad, for messing with my indentations...

contract FitBlitz {
    
	mapping(address => Exercise) public exercises;
	
	event ExerciseBegun(address trainee, address charity, uint startTime, uint targetDurationInMinutes, uint activityGoal );
		
	event ExerciseSuccessful(address trainee, address charity, uint donation, uint targetDuration, uint measuredDuration, uint activityGoal, uint measuredActivity);
	event ExerciseFailed(string reason, address trainee, uint donation, uint targetDuration, uint measuredDuration, uint activityGoal, uint measuredActivity);
	
    event ErrorOcurred(string reason);

	
	
    function FitBlitz() {
        //Can't think of anything that needs to be done when this contract is created.
    }
    
    function BeginExercise( address trainee, address charity, uint startTime, uint targetDurationInMinutes, uint activityGoal ) payable {
		
		//Activity goal is not yet used.
		
		
		exercises[msg.sender] = Exercise(trainee,charity, startTime, targetDurationInMinutes, activityGoal, msg.value, true  );
		//I hate this monstrous struct. Would rather split it into two: wager and targetActivity.
		
    	 //trainee; charity; startTime; targetDuration;activityGoal; wagerInWei; onGoing;
		
		//The user pushes a button on the cell phone (or the watch) and that begins the exercise.
		//The user gives the length of the exercise they are going to do by using the interface on the phone (possibly on the watch, as well).
		
        //The details of the bid need to be saved to a collection.
		
		//Could probably get the time that the exercise begins from the message.
		
		ExerciseBegun(trainee,  charity,  startTime,  targetDurationInMinutes,  activityGoal );
    }
    
    function EvaluateExercise(address _trainee, uint _endTime, uint _measuredActivity) returns (bool){
        //Returns on whether the exercise was successful. If it was, the trainee's money is returned.
        
        //Phone would have to poll this function. Not a problem because 
        //the phone knows when the deadline is.
        //If the trainee was succesful, 
        //The contract returns the ether that the bidder sent to the address.
        //Otherwise, the contract sends the money to charity.
		
		//This function gets the details of the bid from the collection of bids.
		//Then it figures out if the bid was succesful, and sends money accordingly.
		Exercise foundExercise = exercises[_trainee];
		
			
		if (foundExercise.onGoing=false){
		
			
		    ErrorOcurred("havent-started-exercise");
			return false;
	    	//If the given trainee hasn't started an exercise, quit this function.
	    	//I take it that foundExercise.onGoing defaults to 'false' when that trainee hasnt started an execise?
		}
		exercises[_trainee].onGoing = false;
		
		//This is tricky. Some values come from the exercises-collection, some come from the function parameters.
		
		uint donation = foundExercise.donationInWei;
		uint measuredDuration = _endTime - foundExercise.startTime;
		
		if( measuredDuration >= foundExercise.targetDuration) {

		    //At first, this function returns all or sends all. 
		    //Later make it so it returns a percentage based on how much of the exercise was beat. 
		    
		    if (foundExercise.trainee.send(_donation)) {
		        
		        ExerciseSuccessful( _trainee, foundExercise.charity, _donation, foundExercise.targetDuration, _measuredDuration, foundExercise.activityGoal, _measuredActivity);
		        
		        return true;
					 
		    }
			
		} 
		
        if (foundExercise.charity.send(donation)) {
            
		    ExerciseFailed( "didnt-meet-duration-goal",  trainee, donation, foundExercise.targetDuration, measuredDuration, foundExercise.activityGoal, measuredActivity);

            return false;
        }
		
		
		ErrorOcurred("non-existent-charity-address");
		return false;
    }

    struct Exercise {
        //Reminder on how to use structs: 
        //fooStruct myStruct = fooStruct({foo:1, fighter:2});
    
    	address trainee;
    	address charity;
    	uint startTime;
    	uint targetDuration;
    	
    	uint activityGoal;
    	uint donationInWei;
    	
    	bool onGoing; //Is set to true when teh exercise starts. When it ends, is set to false.
    	/*
    	//I take it that this sort of constructor is pointless?
    	function exercise ( address _trainee, address _charity, uint _duration, uint _exerciseGoal ){
    		this.trainee = _trainee;
    		this.charity=_charity;
    		this.duration=_duration;
    		this.exerciseGoal=_exerciseGoal;
    	
    	}
    	*/
    }
}

