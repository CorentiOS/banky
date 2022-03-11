//
//  APIService.swift
//  MyBank
//
//  Created by Corentin Medina on 18/02/2022.
//

import Foundation

class APIService : NSObject {
    
    private let sourceURL = URL(string: "https://a098a324-a16e-44e9-b8ed-b9fe07444510.mock.pstmn.io/accounts")!
    
    func apiToGetAccountData(completion : @escaping (Account) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, URLResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let accountData = try! jsonDecoder.decode(Account.self, from: data)
                completion(accountData)
            }
        }.resume()
    }
    
}
