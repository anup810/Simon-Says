# Simon Says 🎮

Simon Says is a fun, interactive memory game built with **UIKit** in Swift. Players take turns memorizing and repeating a sequence of button flashes. The game supports two players and tracks scores to declare a winner.

---

## Features
- 🎨 **Circular Buttons**: Custom circular buttons with smooth animations.
- 🔄 **Turn-Based Gameplay**: Two-player mode with turn indicators and score tracking.
- 🌈 **Dynamic Color Sequence**: Randomly generated sequences of button flashes.
- 🕹️ **Interactive Gameplay**: Players tap buttons to match the displayed sequence.
- 📈 **Score Tracking**: Updates and displays scores for each player.
- 🏆 **Game Winner**: Declares the winner when a player makes an incorrect tap.

---

## How It Works
1. Tap "Start Game" to begin.
2. Memorize the sequence of flashing buttons.
3. Tap the buttons in the correct order during your turn.
4. Scores are updated for correct sequences; incorrect taps end the game.
5. The game announces the winner!

---

## Setup and Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/anup810/Simon-Says.git
   ```

2. Open the project in Xcode:
   ```bash
   open SimonSays.xcodeproj
   ```

3. Run the project on an iOS simulator or a physical device.

---

## Code Structure

### `ViewController.swift`

- **@IBOutlet**
  - `colorButtons`: Array of buttons representing the game board.
  - `actionButton`: Button to start or continue the game.
  - `playersLabel` and `scoresLabel`: Labels for player turns and scores.

- **Game Logic**
  - `createNewGame()`: Resets the game state.
  - `addNewColor()`: Adds a random color to the sequence.
  - `playSequence()`: Animates the sequence of button flashes.
  - `colorButtonHandler()`: Handles player inputs.
  - `endGame()`: Ends the game and declares a winner.

### `CircularButton.swift`

- **Custom UIButton Subclass**
  - Makes buttons circular.
  - Manages button highlight behavior by adjusting the alpha value when pressed.

---

## Gameplay Mechanics

- **Sequence Generation**: A random sequence of button flashes is generated using `Int.random(in: 0...3)`.
- **Player Input Validation**: Ensures players tap the buttons in the correct order.
- **Animations**: Smooth button flash animations using `UIView.animate(withDuration:)`.
- **Turn Switching**: Alternates turns between two players, highlighting the active player.

---



