pragma solidity ^0.4.0;

///Created by Lauri Johannes Miettinen in fall 2016.

contract FitBlitz {
    
    
    
    function FitBlitz() {
        //Can't think of anything that needs to be done as this contract is created.
    } 
    
    function BeginExercise( address trainee, address charity ,uint startTime, uint duration, uint exerciseGoal  ){
        //Probably don't need a whole bunch of parameters in the function. 
		//Could store these to some "exercise"-object.
		
        //The details of the bid need to be saved to a collection.
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