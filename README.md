# AntFarmFPGA
FPGA antfarm designed in quartus for cyclone IV

<h1>FPGA Antfarm</h1>
<h3>Overview:</h3>

For our final project, we decided to design a virtual ant farm. Similar to Conway’s game of life and Langton’s ant, the game board 
  is an interconnected matrix of blocks, each of which independently make decisions based on its surrounds.  
  Given a set of conditions and operations, the end result will be a satisfying time-lapse of multiple ants terraforming the ground, 
  digging tunnels, and searching for food to return to the colony in order to create more ants. 

<h3>Game Rules:</h3>
	In order to have a realistic ant farm, our ants need to be able to interact with their environment in multiple ways.
  Some of these reals are based on the real behavior of ants, specifically in interaction with other ants during pathfinding.
  Our first rule is that ants will be spawned when the queen ant is given sugar. The queen ant does not move at all, but still makes
  some decisions based on its contents and surroundings. At the beginning of the game, the queen will spawn one ant automatically. 
  Once an ant is spawned, (which will always be in a tunnel) it will walk up the tunnel to find sugar. While walking out of the tunnel, 
  the ant has a chance of running into an ant that has sugar and is heading down to the queen. Ants that currently have sugar have 
  priority, just like with real ant colonies, and the north bound ant will turn right to get out of the way. If the block to the right 
  of the ant is occupied by another ant, the current ant will wait for the other to get out of the way. If the block to the right is not 
  a tunnel, the ant will dig and create a new tunnel, terraforming the Gameworld. From here the ant will head north until it can turn 
  back left, or until it reaches above ground. Once the ant is above ground, it will turn either left or right in order to find sugar. 
  The ant will find sugar and return to the tunnel. Once in the tunnel it will head south and find the queen. The queen consumes the sugar,
  spawning an additional ant to its south, and sending the current ant to its right.

<h3>Technical Design Overview:</h3>
  The first step in our design was to create an individual block. This block needs to first store its block type, a 3-bit number from 000 
  to 111. Next the block needs to store weather or not it contains an ant, and or sugar. Finally, in order to make decisions, it needs to 
  read the inputs of surrounding blocks. To do this the block first has to broadcast its own information. I decided the best way to do this
  would be to output a 8’bits in each direction, north south east and west. As well the block takes inputs from each direction. In order 
  to interact with other blocks which may be at different decision states, our block must send acknowledgment signals for sending, 
  receiving, and validation.  Therefor our final output is as follows. [2:0] block type, [3] contains ant, [4] contains sugar, 
  [5] receiving [6] sending [7]valid/confirmation.
Receiving is simultaneously broadcasted in each direction whereas sending is delivered to a singular specific direction. 
In order for an ant to move to the next block, it must first check the block type and contents of the block it wishes to move too. 
If the block is available, the ant will set its sending bit to 1. Once the receiving block sees this, it will set its contents to
the previous, set receiving to off, and set its valid bit to 1, only for the block which sent. This ensures that if another block 
sends an ant at the same time, it does not assume the other block received the ant. 
To direct the blocks decision making, I created a state machine with 177 possible states. Each block, even if it does not have an ant, 
runs through the same state machine, allowing for an extremely modular system. 
In order to form the game world, each block sets its contents and type to an input stream called Set-in. Each block only does this 
when it is first enabled.  This allows the user to easily create new scenarios for the ants which should give vary different results.
For the purposes of displaying each block to a screen or to 7-segment display, each block contains a DispOut which is a 5’bit output 
where [2:0] is the block type, [3] is an ant, and [4] is sugar.
Again, this allows for a modular system as the end user can decide how to encode these outputs. To make this even easier, 
I created a module which takes inputs from each column, and outputs a 3-bit number for each block. For testing purposes created
a 7-segment display encoder similar to the one we created in one of our previous labs. The beauty of being able to describe each 
block with a 3 bit number is it can be easily used to encode into VGA. For each block, if displayOut[3] == 1’b1, red is on for 
the black, if displayOut[2] == 1’b1 then green is on for that block, etc. given these three bits, and using the RGB values of the
VGA output, returns an 8-bit color scheme, the same exact color scheme commonly used by CGA graphics in the 90s, consisting of bright 
colors such as cyan and pink.

<h3>VGA:</h3>
<b>Brian please fill out</b>

<h3>Photos and videos:</h3>

