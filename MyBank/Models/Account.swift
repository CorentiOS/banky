//
//  Account.swift
//  MyBank
//
//  Created by Corentin Medina on 18/02/2022.
//

import Foundation

// MARK: - Account
struct Account: Codable {
    let banks: [Bank]
}

// MARK: - Bank
struct Bank: Codable {
    let name: String
    let isCA: Int
    let accounts: [AccountElement]
}

// MARK: - AccountElement
struct AccountElement: Codable {
    let order: Int
    let id, holder: String
    let role: Int
    let contractNumber, label, productCode: String
    let balance: Double
    let operations: [Operation]

    enum CodingKeys: String, CodingKey {
        case order, id, holder, role
        case contractNumber = "contract_number"
        case label
        case productCode = "product_code"
        case balance, operations
    }
}

// MARK: - Operation
struct Operation: Codable {
    let id, title, amount, category: String
    let date: String
}
