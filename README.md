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


# Game
The Game has an instance variable for the Board and previously-guessed position.
It also has methods for managing the Board-Player interaction.
``` play ``` runs until the game is over. Inside the loop, it ``` render ```
the board, ``` prompt ``` the player for input, and get a ``` guessed_pos ```
and passes it to ``` make_guess ```


# TODO
-[ ]- Implement a simple command-line interface, allowing the user to determine the difficulty of the game (i.e., the size of the board). Do this before the Game is ``` initialize ``` d. Remember ``` if __FILE__ == $PROGRAM_NAME! ```
-[ ]- Enforce an upper limit on the number of turns played. If the limit is exceeded, the player loses.
-[ ]- Let's add a twist: start the game by placing a certain number of "bombs" instead of normal cards. When the game starts, show the bombs for 5 seconds or so; then hide them. If the player reveals a bomb, the game ends. (If you feel this is too harsh, perhaps you can implement "lives" or "hit points"). You might also want to determine the bomb count as a function of board size.
-[ ]- Typing a two-coordinate position is kind of clunky. Implement a cursor and allow the player to select cards with the arrow keys and Enter.
-[ ]- We've already got a working "Match 2" puzzle. What about a "Match 3" or "Match 4"? Generalize your code to work for any number of matching cards.
