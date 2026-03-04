# Mastermind

A terminal-based implementation of the classic Mastermind code-breaking game written in Ruby. Try to crack a randomly generated 4-colour secret code in 12 attempts using feedback from red and white pegs.

---

## How to Play

**Prerequisites:** Ruby must be installed. Verify with:

```bash
ruby -v
```

**Run the game:**

```bash
git clone https://github.com/Car-riane/mastermind.git
cd mastermind
ruby game.rb
```

---

## Rules

- A secret code is randomly generated from 6 colours: `r` (red), `g` (green), `b` (blue), `y` (yellow), `p` (purple), `o` (orange)
- Each turn, enter a 4-colour guess (e.g. `rgby`)
- After each guess you receive feedback:
  - 🔴 **Red peg** — right colour, right position
  - ⚪ **White peg** — right colour, wrong position
- Crack the code in 12 attempts or fewer to win

---

## Project Structure

```
mastermind/
├── game.rb     # All game logic — Game class, guess evaluation, game loop
├── code.rb     # (planned) Extract Code class for secret code generation
└── player.rb   # (planned) Extract Player class for input handling
```

---

## Class Design

The game is built around a single `Game` class with clearly separated private methods:

**`initialize`** — generates the random secret code from the 6 available colours and sets the turn limit to 12.

**`play`** — runs the main game loop, calls `get_guess` and `evaluate_guess` each turn, prints peg feedback, and checks the win condition after every attempt.

**`get_guess`** — handles all player input in a validation loop, ensuring the guess is exactly 4 characters and only uses valid colour letters. Rejects bad input with a helpful message rather than crashing.

**`evaluate_guess`** — implements a two-pass peg-counting algorithm. The first pass finds exact matches (red pegs) and nullifies those positions. The second pass checks remaining colours for wrong-position matches (white pegs). This prevents the same colour from being double-counted.

---

## What I Learned

- Structuring a Ruby program with a class and private helper methods instead of top-level procedural code
- Implementing the two-pass Mastermind feedback algorithm — exact matches must be resolved before checking colour-only matches to avoid double-counting
- Using `dup` to avoid mutating the original secret code array during guess evaluation
- Writing input validation loops with clear, helpful error messages
- Debugging common Ruby errors: `+= !` (boolean operator used instead of integer `1`) and logic running directly in the class body instead of inside methods

---

## Built With

- Ruby (no external gems required)

---

## Future Improvements

- Add RSpec tests for the `evaluate_guess` peg-counting logic
- Add a computer codebreaker mode using a solving algorithm
- Extract `Code` and `Player` into separate classes for better separation of concerns
- Display a colour legend at the start of each game
- Track scores across multiple rounds
