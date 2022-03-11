//
//  ViewController.swift
//  MyBank
//
//  Created by Corentin Medina on 18/02/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var accountTableView: UITableView!
    private var accountViewModel : AccountViewModel!
    private var dataSource : AccountTableViewDataSource<AccountTableViewCell, Bank>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountTableView.delegate = self
        accountTableView.isScrollEnabled = false
        self.view.addSubview(UIView(frame: .zero))
        self.view.addSubview(accountTableView)
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        self.accountViewModel = AccountViewModel()
        self.accountViewModel.bindAccountViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        
        var sortedAccountData: [Bank] = []
        sortedAccountData = self.accountViewModel.accountData.banks.sorted {$0.name < $1.name}
        
        self.dataSource = AccountTableViewDataSource(cellIdentifier: "AccountTableViewCell", items: sortedAccountData, configureCell: { (cell, evm) in
            
            //            if evm.isCA == 1 {
            //                self.accountTableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
            //            }
            
            cell.accountName.text = evm.name
            cell.amountAccount.text = "\(evm.accounts[0].balance) €"
        })
        DispatchQueue.main.async {
            self.accountTableView.dataSource = self.dataSource
            self.accountTableView.reloadData()
        }
    }

    //MARK: Show Detail Account
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datas = self.accountViewModel.accountData.banks
        accountTableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "DetailAccountController") as? DetailAccountController
        vc?.accountDetail = datas[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

