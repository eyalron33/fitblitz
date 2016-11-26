pragma solidity ^0.4.0;

///Created by Lauri Johannes Miettinen in fall 2016.

//Screw you, Notepad, for messing with my indentations...

contract FitBlitz {
    
	mapping(address => exercise) public exercises;
	//TODO: Actually code the exercise-object.
	
    function FitBlitz() {
        //Can't think of anything that needs to be done when this contract is created.
    } 
    
    function BeginExercise( address trainee, address charity, uint duration, uint exerciseGoal ) payable {
		
		var newExercise = exercise(trainee,charity, duration, exerciseGoal, msg.amount );
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
		exercise foundExercise = exercises(trainee);
		
		if (!foundExercise){
		    return;
	    	//If the given trainee hasn't started an exercise, quit this function.
		}
		
		uint wager = foundExercise.wagerInWei;
		
		if(beatDeadline) {
		    //TODO: A function that returns boolean on whether the deadline was beat.
		    //Maybe first just make it so it returns all or sends all. 
		    //Later make it so it returns a percentage based on how much of the exercise was beat. 
		    
		    trainee.send(wager);
			
		} else {
		    charity.send(wager);
		}
		
    }


    
    struct exercise {
//Reminder on how to use structs: 
//fooStruct myStruct = fooStruct({foo:1, fighter:2});

	address trainee;
	address charity;
	uint duration;
	uint activityGoal;
	uint wagerInWei;
	
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

