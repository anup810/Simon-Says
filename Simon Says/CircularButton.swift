//
//  CircularButton.swift
//  Simon Says
//
//  Created by Anup Saud on 2024-12-18.
//

import UIKit

class CircularButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width/2
        layer.masksToBounds = true

    }
    override var isHighlighted: Bool {
        didSet{
            if isHighlighted{
                alpha = 1.0
            } else{
                alpha = 0.5
            }
        }
    }

}
