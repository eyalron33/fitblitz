pragma solidity ^0.4.0;

///Created by Lauri Johannes Miettinen in fall 2016.

//Screw you, Notepad, for messing with my indentations...

contract FitBlitz {
    
	mapping(address => Exercise) public exercises;
	
    function FitBlitz() {
        //Can't think of anything that needs to be done when this contract is created.
    } 
    
    function BeginExercise( address trainee, address charity, uint duration, uint exerciseGoal ) payable {
		
		var newExercise = Exercise(trainee,charity, duration, exerciseGoal, msg.value, true  );
		//I hate this monstrous struct. Would rather split it into two: wager and activity.
		
		
		//The user pushes a button on the cell phone (or the watch) and that begins the exercise.
		//The user gives the length of the exercise they are going to do by using the interface on the phone (possibly on the watch, as well).
		
        //The details of the bid need to be saved to a collection.
		
		//Could probably get the time that the exercise begins from the message.
    }
    
    function CollectReward(address trainee){
        //Phone would have to poll this function. Not a problem because 
        //the phone knows when the deadline is.
        //If the trainee was succesful, 
        //The contract returns the ether that the bidder sent to the address.
        //Otherwise, the contract sends the money to charity.
		
		//This function gets the details of the bid from the collection of bids.
		//Then it figures out if the bid was succesful, and sends money accordingly.
		Exercise foundExercise = exercises[trainee];
		
		if (foundExercise.onGoing=false){
		    return;
	    	//If the given trainee hasn't started an exercise, quit this function.
	    	//I take it that foundExercise.onGoing defaults to 'false' when that trainee hasnt started an execise?
		}
		
		uint wager = foundExercise.wagerInWei;
		
		if( BeatDeadline(foundExercise) ) {
		    //TODO: A function that returns boolean on whether the deadline was beat.
		    //Maybe first just make it so it returns all or sends all. 
		    //Later make it so it returns a percentage based on how much of the exercise was beat. 
		    
		    if (!trainee.send(wager)){
		        throw;
		    }
			
		} else {
		     if (!foundExercise.charity.send(wager)){
	           throw;
		     }
		}
		
    }

function BeatDeadline(Exercise exercise) returns (bool){
    
}
    
    struct Exercise {
//Reminder on how to use structs: 
//fooStruct myStruct = fooStruct({foo:1, fighter:2});

	address trainee;
	address charity;
	
	uint duration;
	uint activityGoal;
	uint wagerInWei;
	
	bool onGoing; //Is set to true when teh exercise starts. When it ends, is set to false.
	/*
	//I take it that this sort of constructor is pointless?
	function exercise ( address _trainee, address _charity, uint _duration, uint _exerciseGoal ){
		this.trainee = _trainee;
		this.charity=_charity;
		this.duration=_duration;
		this.exerciseGoal=_exerciseGoal;
	
	}*/
    }
}

