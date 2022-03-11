//
//  UILabel+Extension.swift
//  MyBank
//
//  Created by Corentin Medina on 21/02/2022.
//

import UIKit

extension UILabel {
    
    // adding space between each characters
    func addCharacterSpacing(kernValue: Double = 3) {
        if let labelText = text, labelText.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern,
                                          value: kernValue,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
