# fitblitz
Pebble meets blockchain

# Inspiration

Germany has a funny way to keep your teeth clean.

You deposit money in the beginning of each year, and only get it back if you actually went to the dentist during the year.

We decided to take this "keep yourself healthy, or you'll lose money" one step forward. We want to motivate people to keep good shape.

# What it does
First, you choose how many minutes you want to run today. Then you choose how much money you want to "invest" in this running.

The money is locked in a smart contract on Ethereum's blockchain.

The code of the contract will give you the money back only if you run the amount of minutes you promised to! If you did - congratulations! You get the money back. If you did only 80%? You get 80% back. The rest is sent, automatically, as a donation to charity.

To keep track of how much you run, we used a Pebble smartwatch.

# Tech
The project has three parts: pebble, blockchain and a mobile website that connects them all and gives interface.

The Pebble is programmed in C language. We used CloudPebble to do that. It communicates with the phone using a node.js server.

The phone lets the user choose the amount of running time and money to invest in it. We built it with proto.io and bootstrap frameworks. It then use web3.js to transfer this information to Ethereum's blockchain.

We wrote a smart contract to the blockchain using Solidity language. It first gets the conditions from the phone and locks the money. Once it gets information from Pebble on how much running you actually did, it either sends you the whole amount back, or pass some of it to charity.

This smart contract, as all blockchain code, is immutable, and cannot be cheated.
