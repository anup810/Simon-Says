//
//  ViewController.swift
//  Simon Says
//
//  Created by Anup Saud on 2024-12-17.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets for Buttons and Labels
    @IBOutlet var colorButtons: [CircularButton]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var playersLabel: [UILabel]!
    @IBOutlet var scoresLabel: [UILabel]!
    
    // MARK: - Game State Variables
    var currentPlayer = 0
    var scores = [0,0]
    
    var sequenceIndex = 0
    var colorSequence = [Int]()
    var colorToTap = [Int]()
    var gameEnded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Sort buttons and labels by their tag for consistent order
        colorButtons = colorButtons.sorted(by: {  $0.tag < $1.tag })
        playersLabel = playersLabel.sorted(by: { $0.tag < $1.tag})
        scoresLabel = scoresLabel.sorted(by: { $0.tag < $1.tag})
        
        createNewGame()
   
    }
    // Detect screen touches to restart the game after it ends
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameEnded{
            gameEnded = false
            createNewGame()
        }
    }
    // MARK: - Game Initialization
    func createNewGame() {
        colorSequence.removeAll()
        actionButton.setTitle("Start Game", for: .normal)
        actionButton.isEnabled = true


        for button in colorButtons {
            button.alpha = 0.5
            button.isEnabled = false
        }
        // Reset player scores and active player indicator
        currentPlayer = 0
        scores = [0,0]
        playersLabel[currentPlayer].alpha = 1.0
        playersLabel[1].alpha = 0.75
        updateScoreLabels()
    }
    // Update the score labels to reflect the current scores
    func updateScoreLabels(){
        for (index, label) in scoresLabel.enumerated(){
            label.text = "\(scores[index])"
        }
    }
    
    // Switch active player
    func switchPlayers(){
        playersLabel[currentPlayer].alpha = 0.75
        currentPlayer = currentPlayer == 0 ? 1 : 0
        playersLabel[currentPlayer].alpha = 1.0
    }
    
    // Add a new random color to the sequence
    func addNewColor(){
        colorSequence.append(Int.random(in: 0...3))
    }
    
    // Play the sequence of colors with animations
    func playSequence(){
        if sequenceIndex < colorSequence.count{
            flash(button: colorButtons[colorSequence[sequenceIndex]])
            sequenceIndex += 1
        }else{
            colorToTap = colorSequence
            view.isUserInteractionEnabled = true
            actionButton.setTitle("Tap the Circles", for: .normal)
            for button in colorButtons{
                button.isEnabled = true
            }
        }
        
    }
    
    
    // Flash animation for a button
    func flash(button:CircularButton){
        UIView.animate(withDuration: 0.5) {
            button.alpha = 1.0
            button.alpha = 0.5
        } completion: { bool in
            self.playSequence()
            
        }

        
    }
    // End the game and display the winner
    func endGame(){
        let message = currentPlayer == 0 ? "Playeer 2 Wins!" : "Player 1 Wins!"
        actionButton.setTitle(message, for: .normal)
        gameEnded = true
    }

    // Handle taps on color buttons
    @IBAction func colorButtonHandler(_ sender: CircularButton) {
        if sender.tag == colorToTap.removeFirst(){
            
        }else{
            for button in colorButtons{
                button.isEnabled = false
            }
            endGame()
            return
        }
        
        // If all buttons in the sequence were tapped correctly
        if colorToTap.isEmpty{
            for button in colorButtons{
                button.isEnabled = false
            }
            scores[currentPlayer] += 1
            updateScoreLabels()
            switchPlayers()
            actionButton.setTitle("Continue", for: .normal)
            actionButton.isEnabled = true
            
        }
       
    }
    // Handle taps on the action button
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        sequenceIndex = 0
        actionButton.setTitle("Memorize", for: .normal)
        actionButton.isHidden = false
        view.isUserInteractionEnabled = false
        // Add a new color and play the sequence
        addNewColor()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
            self.playSequence()
        }
    }
    
}

