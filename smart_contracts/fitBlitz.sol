pragma solidity ^0.4.0;

///Created by Lauri Johannes Miettinen in fall 2016.

contract FitBlitz {
    
	//mapping(address => exercise) public exercises;
	//TODO: Actually code the exercise-object.
	//Maybe not an object, but a token? Can I have attributes and/or variables on tokens?
	//From what I understood, tokens are the way to go: https://www.ethereum.org/crowdsale
	
    function FitBlitz() {
        //Can't think of anything that needs to be done when this contract is created.
    } 
    
    function BeginExercise( address trainee, address charity, uint duration, uint exerciseGoal ){
        //Probably don't need a whole bunch of parameters in the function. 
		//Could store these to some "exercise"-object.
		
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
		
    }
    
    
    
}