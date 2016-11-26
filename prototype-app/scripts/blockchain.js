	<!doctype>
<html>
<head>

	<script src="js/bignumber.min.js"></script>
	<script src="js/web3-light.js"></script>

	<script>
		var Web3 = require('web3');
		var web3 = new Web3();
		web3 = new Web3(new Web3.providers.HttpProvider("http://craigsailor.com:8545"));
		// web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

		// let's assume that coinbase is our account
		web3.eth.defaultAccount = web3.eth.coinbase;
	</script>

	<script src="deployment.js"> </script> 
	
	<script type='text/javascript'>
		function BeginExercise() {
			var address = web3.eth.defaultAccount;
			
			var res = contracts['FitBlitz'].contract.BeginExercise("0xa9801d7de7c71c7a282ada797e8bfc5192ceaf88", 50, 5);
		}

		function EvaluateExercise() {
			var res = contracts['FitBlitz'].contract.EvaluateExercise(52, 10);
		}

		// -=- Events -=- //
		var ExerciseBegun = contracts['FitBlitz'].contract.ExerciseBegun(function(error, result) {
    if (!error) {
    	console.log("exercised began");
		} else {
			console.log("failed exercised began");
		}});

		var ExerciseSuccessful = contracts['FitBlitz'].contract.ExerciseSuccessful(function(error, result) {
    if (!error) {
    	console.log("exercise succeed");
		} else {
			console.log("failed exercise succeed");
		}});

		var ExerciseFailed = contracts['FitBlitz'].contract.ExerciseFailed(function(error, result) {
    if (!error) {
    	console.log("exercise failed");
		} else {
			console.log("failed exercise failed");
		}});

		var ErrorOcurred = contracts['FitBlitz'].contract.ErrorOcurred(function(error, result) {
    if (!error) {
    	console.log("error occured");
		} else {
			console.log("failed error occured");
		}});

	</script>
</head>

<body bgcolor='#E6E6FA'>
  <h3>Test fitBlitz smart contract</h3>
<div>
Begin exercise: <button onclick='BeginExercise()'>Begin</button> <br>
Evaluate exercise: <button onclick='EvaluateExercise()'>Evaluate</button>
</div>
Outputs:
  <div id='outputs'></div>
</div>
</body>
