# UNBEATABLE TIC-TAC-TOE

This was the first piece of usable software I'd written.

It's a CLI game of Tic Tac Toe vs. the CPU.

The goal was to write the game such that the CPU never loses.

**How it avoids losing**
- Hard code the only 8 winning combinations
- Keep track of "available positions"
- CPU cross references those two lists to score its best move

**CPU's decision-making logic**
1. Iterate through each available position on the board.
2. At each point in the iteration, simulate the CPU selecting that position
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

# ISSUES:

We succeeded in making the CPU unbeatable, but most games end in Tie. Version 2 would be embedding a more opportunistic scoring system that optimizes for the CPU winning, instead of simply the human gamer NOT winning.

Medium article associated: https://medium.com/@jdprince555/ruby-cli-tic-tac-toe-b1a067807e61
