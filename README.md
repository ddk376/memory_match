# Memory match
Simple command-line version of classic Match 2 memory card game

# Card
A card has a value and a boolean state, revealed.
Implemented class methods include
``` #hide ```, ``` #reveal ```, ``` #revealed? ```, ``` #to_s ```, ``` #== ```

# Board
The Board is responsible for keeping track of all the cards. There is a grid
instance variable to contain all the cards

* ``` #populate ``` should fill the board with a set of shuffled Card pairs
* ``` #render ``` should print out a representation of the Board's current state
* ``` #won? ``` should return true if all cards have been revealed.
* ``` #reveal ``` should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).
