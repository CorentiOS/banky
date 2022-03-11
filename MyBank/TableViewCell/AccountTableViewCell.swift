//
//  AccountTableViewCell.swift
//  MyBank
//
//  Created by Corentin Medina on 19/02/2022.
//

import UIKit

class AccountTableViewCell : UITableViewCell {
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var amountAccount: UILabel!
    
    var bank : Bank? {
        didSet {
            accountName.text = bank?.name
        }
    }
    
    var accountElement : AccountElement? {
        didSet {
            amountAccount.text = "\(accountElement?.balance ?? 0) €"
        }
    }
}
