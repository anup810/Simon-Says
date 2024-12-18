//
//  ViewController.swift
//  Simon Says
//
//  Created by Anup Saud on 2024-12-17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorButtons: [CircularButton]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var playersLabel: [UILabel]!
    @IBOutlet var scoresLabel: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorButtons = colorButtons.sorted(by: {  $0.tag < $1.tag })
        playersLabel = playersLabel.sorted(by: { $0.tag < $1.tag})
        scoresLabel = scoresLabel.sorted(by: { $0.tag < $1.tag})
        
        createNewGame()
   
    }
    func createNewGame() {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Futura-Bold", size: 25) ?? UIFont.boldSystemFont(ofSize: 25)
        ]

        let attributedTitle = NSAttributedString(string: "Start Game", attributes: attributes)
        actionButton.setAttributedTitle(attributedTitle, for: .normal)


        for button in colorButtons {
            button.alpha = 0.5
        }
    }

    
    @IBAction func colorButtonHandler(_ sender: CircularButton) {
        print("Button \(sender.tag) tapped")
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
    }
    
}

