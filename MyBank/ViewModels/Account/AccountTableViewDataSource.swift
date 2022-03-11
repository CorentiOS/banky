//
//  AccountTableViewDataSource.swift
//  MyBank
//
//  Created by Corentin Medina on 19/02/2022.
//

import Foundation
import UIKit

class AccountTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var cellIdentifier: String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    init(cellIdentifier: String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
        // FIXME: FILTER isCA ?
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Crédit Agricole"
        default:
            return "Autres Banques"
        }
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("test")
    //        accountTableView.deselectRow(at: indexPath, animated: true)
    //        let vc = storyboard?.instantiateViewController(identifier: "DetailAccountController") as?  DetailAccountController
    //        self.navigationController?.pushViewController(vc!, animated: true)
    //        vc?._marchantName = obj[indexPath.row].marchant
    //
    //    }
}
