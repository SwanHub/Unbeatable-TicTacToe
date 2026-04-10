# Unbeatable Tic-Tac-Toe

This was the first piece of usable software I'd written.

It's a CLI game of Tic Tac Toe vs. the CPU.

The goal was to write a game where CPU never loses.

**CPU's decision-making logic**
1. Iterate through each available position on the board.
2. At each point in the iteration, simulate selecting that position
3. Based on that selection, create a second iteration of all moves the human gamer could then make
4. For each of those possible human gamer moves, score the availability of a row of 3 
5. Ensure CPU DOES NOT select a position that leads to the gamer having a row of 3 available 

**Adding personality**
  - Ask who wants to go first after each game.
  - Add an option to allow a random number generator to determine first move.
  - Easy/Medium/Hard mode (Easy mode = cpu chooses a random move)
  - A hardcoded list of funny 'given' nicknames the cpu offers the gamer at the start.
  - Keep track of record (w/l/t) throughout each single session.
  - A delay function to make it seem like the system is thinking.
  - During the delay, the computer chirps the gamer.

That's it! Works well. Can't beat it. Auto-blocker.

**Future work**
- Would like to put this game out on the web.
- Improve the algorithm to make the CPU more opportunistic toward winning. It exclusively keeps the gamer from winning, so almost all games end in a tie.
