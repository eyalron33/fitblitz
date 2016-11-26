pragma solidity ^0.4.2;

///Created by Lauri Johannes Miettinen in fall 2016.

//Screw you, Notepad, for messing with my indentations...

contract FitBlitz {
    
	mapping(address => Exercise) private exercises;
	
	event ExerciseBegun(address trainee, address charity, uint donation, uint startTime, uint targetDurationInMinutes );
		
	event ExerciseSuccessful(address trainee, address charity, uint donation, uint targetDuration, uint measuredDuration);
    
    event ExerciseFailed(string reason, address trainee, address charity, uint donation, uint targetDuration, uint measuredDuration);
	
    event ErrorOcurred(string reason);
	//TODO: Probably should have added an address, who caused the error.
	//Better yet, should have made it so the error message is returned as a string.
	//These events are broadcast to the whole blockchain. 
	//Why does everyone in the world need to know that some dumbass fucked up?
	
    function FitBlitz() {
        //Can't think of anything that needs to be done when this contract is created.
    }
    
    function BeginExercise(  address _charity, uint _startTime, uint _targetDurationInMinutes ) payable {
		
		//Activity goal is not yet used.
		address trainee = msg.sender;
		uint donation = msg.value;
		
		exercises[msg.sender] = Exercise(trainee, _charity, _startTime, _targetDurationInMinutes, donation, true  );
		//I hate this monstrous struct. Would rather split it into two: wager and targetActivity.
		
		//The user pushes a button on the cell phone (or the watch) and that begins the exercise.
		//The user gives the length of the exercise they are going to do by using the interface on the phone (possibly on the watch, as well).
		
        //The details of the bid need to be saved to a collection.
		
		//Could probably get the time that the exercise begins from the message.
		
		ExerciseBegun(trainee,  _charity, donation,  _startTime,  _targetDurationInMinutes );
    }
    
    function EvaluateExercise(uint endTime) returns (bool){
        //Returns on whether the exercise was successful. If it was, the trainee's money is returned.
        
    	address trainee = msg.sender;
        
        //Phone would have to poll this function. Not a problem because 
        //the phone knows when the deadline is.
        //If the trainee was succesful, 
        //The contract returns the ether that the bidder sent to the address.
        //Otherwise, the contract sends the money to charity.
		
		//This function gets the details of the bid from the collection of bids.
		//Then it figures out if the bid was succesful, and sends money accordingly.
		Exercise foundExercise = exercises[trainee];
		
		/*
		if ( foundExercise.trainee==0) {
		    ErrorOcurred("havent-started-exercise");
			return false;
		}
		//I surmise that this clause causes every single execution of the function to fail.
		*/

		
		if (foundExercise.onGoing==false){
		
		    ErrorOcurred("havent-started-exercise");
			return false;
	    	//If the given trainee hasn't started an exercise, quit this function.
	    	//I take it that foundExercise.onGoing defaults to 'false' when that trainee hasnt started an execise?
		}
		exercises[trainee].onGoing = false;
		
		address charity = foundExercise.charity;
		uint donation = foundExercise.donation;
		uint targetDuration = foundExercise.targetDuration;
		uint measuredDuration = endTime - foundExercise.startTime;
		//uint activityGoal = foundExercise.activityGoal;
		
		if( measuredDuration >= targetDuration) {

		    //At first, this function returns all or sends all. 
		    //Later make it so it returns a percentage based on how much of the exercise was beat. 
		    
		    if (trainee.send(donation)) {
		        
		        ExerciseSuccessful( trainee, charity, donation, targetDuration, measuredDuration);
		        
		        return true;
		    }
		} 
		
        if (foundExercise.charity.send(donation)) {
            
		    ExerciseFailed( "didnt-meet-duration-goal",  trainee,  charity, donation, targetDuration, measuredDuration);
	
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
    	
    	//uint activityGoal;
    	uint donation;
    	
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

