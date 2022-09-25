//
//  Criptomonedas.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 19/9/22.
//

import Foundation


public struct ResponseCriptomonedas: Codable{
    public var data: [Criptomoneda]?
}

public struct Criptomoneda: Codable{
    public var id: String?
    public var name: String?
    public var symbol: String?
    public var priceUsd: String?
    public var changePercent24Hr: String?
}
