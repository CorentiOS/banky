//
//  DetailAccountTableViewCell.swift
//  MyBank
//
//  Created by Corentin Medina on 21/02/2022.
//

import UIKit

class DetailAccountTableViewCell : UITableViewCell {
    
    @IBOutlet weak var operationTitle: UILabel!
    @IBOutlet weak var operationDate: UILabel!
    @IBOutlet weak var operationAmount: UILabel!
    
    var operation : Operation? {
        didSet {
            operationTitle.text = operation?.title
            operationDate.text = operation?.date
            operationAmount.text = ("\(operation?.amount ?? "0") + €")
        }
    }
    
}

