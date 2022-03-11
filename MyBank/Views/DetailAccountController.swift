//
//  DetailAccountController.swift
//  MyBank
//
//  Created by Corentin Medina on 20/02/2022.
//

import UIKit

class DetailAccountController : UIViewController {
    
    @IBOutlet weak var accountAmountLabel: UILabel!
    @IBOutlet weak var accountTitleLabel: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    
    private var dataSource : DetailAccountTableViewDataSource<DetailAccountTableViewCell, Operation>!
    
    var accountDetail = Bank(name: "", isCA: 0, accounts: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateDataSource()
    }
    
    func setupUI() {
        accountTitleLabel.text = accountDetail.name
        accountAmountLabel.text = "\(accountDetail.accounts[0].balance) €"
        accountTitleLabel.sizeToFit()
        accountAmountLabel.sizeToFit()
        detailTableView.isScrollEnabled = false
    }
    
    func updateDataSource() {
        var operationByAcc: [Operation] = []
        operationByAcc = accountDetail.accounts[0].operations.sorted {$0.date < $1.date}
        
        self.dataSource = DetailAccountTableViewDataSource(cellIdentifier: "DetailAccountTableViewCell", items: operationByAcc, configureCell: {
            (cell, evm) in
            
            let unixDate = Double(evm.date)
            let transacDate = Date(timeIntervalSince1970: unixDate ?? 0)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            
            cell.operationTitle.text = evm.title
            cell.operationDate.text = dateFormatter.string(from: transacDate)
            cell.operationDate.addCharacterSpacing(kernValue: 0.25)
            cell.operationAmount.text = ("\(evm.amount) €")
        })
        
        DispatchQueue.main.async {
            self.detailTableView.dataSource = self.dataSource
            self.detailTableView.reloadData()
        }
    }
}
