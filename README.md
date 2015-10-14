# Memory match
Simple command-line version of classic Match 2 memory card game

# How to player
``` ruby memory.rb ```

# TODO
- [ ] Implement a simple command-line interface, allowing the user to determine the difficulty of the game (i.e., the size of the board). Do this before the Game is ``` initialize ``` d. Remember ``` if __FILE__ == $PROGRAM_NAME! ```
- [ ] Enforce an upper limit on the number of turns played. If the limit is exceeded, the player loses.
- [ ] Let's add a twist: start the game by placing a certain number of "bombs" instead of normal cards. When the game starts, show the bombs for 5 seconds or so; then hide them. If the player reveals a bomb, the game ends. (If you feel this is too harsh, perhaps you can implement "lives" or "hit points"). You might also want to determine the bomb count as a function of board size.
- [ ] Cursor Implementation
- [ ]  Generalize code to work for any number of matching cards.
