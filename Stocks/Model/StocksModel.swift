//
//  StocksModel.swift
//  Stocks
//
//  Created by sidkotha on 06/05/23.
//

import Foundation

// MARK: - Stocks
struct Stocks: Codable {
    let clientID: String
    let data: [StockModel]
    let error: JSONNull?
    let responseType: String
    let timestamp: Int

    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case data, error
        case responseType = "response_type"
        case timestamp
    }
}

// MARK: - StockModel
struct StockModel: Codable {
    let avgPrice: String
    let cncUsedQuantity, collateralQty: Int
    let collateralType: String
    let collateralUpdateQty: Int
    let companyName: String
    let haircut: Double
    let holdingsUpdateQty: Int
    let isin, product: String
    let quantity: Int
    let symbol: String
    let t1HoldingQty: Int
    let tokenBse, tokenNse: String
    let withheldCollateralQty, withheldHoldingQty: Int
    let ltp, close: Double

    enum CodingKeys: String, CodingKey {
        case avgPrice = "avg_price"
        case cncUsedQuantity = "cnc_used_quantity"
        case collateralQty = "collateral_qty"
        case collateralType = "collateral_type"
        case collateralUpdateQty = "collateral_update_qty"
        case companyName = "company_name"
        case haircut
        case holdingsUpdateQty = "holdings_update_qty"
        case isin, product, quantity, symbol
        case t1HoldingQty = "t1_holding_qty"
        case tokenBse = "token_bse"
        case tokenNse = "token_nse"
        case withheldCollateralQty = "withheld_collateral_qty"
        case withheldHoldingQty = "withheld_holding_qty"
        case ltp, close
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
        self.hash(into: &hasher)
    }
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
