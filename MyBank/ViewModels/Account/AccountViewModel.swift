//
//  AccountViewModel.swift
//  MyBank
//
//  Created by Corentin Medina on 18/02/2022.
//
import Foundation

class AccountViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var accountData : Account! {
        didSet {
            self.bindAccountViewModelToController()
        }
    }
    
    var bindAccountViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetAccountData()
    }
    
    func callFuncToGetAccountData() {
        self.apiService.apiToGetAccountData { (accountData) in
            self.accountData = accountData
        }
    }
}
