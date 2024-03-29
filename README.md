# TIC-TAC-TOE

CLI Program –– Tic Tac Toe vs. Computer

My first computer program created from scratch.

The rules are what they've always been. Strike three positions in a row before your
opponent. In this version, your opponent is the computer.

My primary goal was to create an algorithm that responds to the
user's moves and can't lose. My secondary goal was to program a
slew of features that would give the game some personality.

Steps to complete the primary goal:
    Fortunately, this isn't Go. There are only nine positions on the board and
    eight winning combinations. I used those winning combinations, in conjunction
    with a dwindling array of "available positions", as the basis for the
    response algorithm. Once the gamer makes a move, this is the response routine
    the 'cpu' executes:

1. Iterate through each available position on the board.
2. At each loop of the iteration, simulate choosing that position.
3. Once a position choice is simulated, determine the 'cpu_score' and 'gamer_score'
   for every remaining position on the board. In doing so, I'm trying to locate the
   cpu move which will lead to the gamer's lowest probability of winning. 'Scores'
   are calculated as follows:
   - a 'winning combination' (e.g. [a1, a2, a3], [a1, b2, c3], etc.) with 1 'cpu'
     or 'gamer' position chosen and nothing else chosen is worth 2 points.
   - a 'winning combination' with 2 'cpu' or 'gamer' positions chosen and nothing
     else chosen is worth 10 points.
   - a 'winning combination' with 3 'cpu' or 'gamer' positions chosen and nothing
     else chosen is worth 100 points.
4. Calculate the difference between 'gamer' and 'cpu' scores for all moves
   the gamer can make post 'cpu'-simulated move.
5. Push all of those differences ('gamer_score' - 'cpu_score') into an array.
6. Push that array of differences into a larger array.

  Note: at this point, we have an array of arrays. We have an array of
  available positions the 'cpu' can take, and for each of those positions an array
  of responses with which the 'gamer' can respond. These 'responses' are
  represented by a meaningful value, the difference between 'gamer' and 'cpu' score.

7. 'CPU' then locates the best possible response the gamer can make for each
   simulated cpu move.

  Note: the 'best possible response' will be the LOWEST value in each of those
  innermost arrays.

8. Then I choose the 'cpu' move which correlates to the HIGHEST of these LOWEST
   values.

  Note: by choosing the HIGHEST number in the array of LOWEST values,
  the 'cpu' is choosing that position which most effectively limits the gamer's
  potential score and advances the cpu's potential score.

Secondary features:
  - Ask who wants to go first after each game.
  - Add an option to allow a random number generator to determine first move.
  - Easy/Medium/Hard mode (Easy mode = cpu chooses a random move)
  - A catalogue of 'given' nicknames the cpu offers the gamer at the start.
  - Keep track of record (w/l/t) throughout the program.
  - A delay function to make it seem like the system is thinking.
  - During delay: computer chirps the gamer.

That's it! Works well. 

# ISSUES:

While I successfully created a game which keeps the user from winning, I also
unfortunately created a game which doesn't win unless by user mistake. The 
vast majority of games will end in a 'tie'. If I revisit this game, I'll
attempt to create a more offensive-minded algorithm, one which will actually
try to trick you and set you up to lose. 

I would also continue to clean it and pare the code down. With a little more
concerted effort on D.R.Y., I could get it down another hundred lines. 

Medium article associated: https://medium.com/@jdprince555/ruby-cli-tic-tac-toe-b1a067807e61
