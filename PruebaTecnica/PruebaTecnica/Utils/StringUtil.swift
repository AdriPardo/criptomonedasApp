//
//  File.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 25/9/22.
//

import Foundation

extension String{
    func setFormattedPrice()->String{
        let price = Double(self) ?? 0.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 0
        formatter.roundingMode = .halfEven
        return formatter.string(from: NSNumber(value: price))! + " $"
    }
    func setFormattedPercentage()->String{
        let percent = Double(self) ?? 0.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = .autoupdatingCurrent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.roundingMode = .halfEven
        return formatter.string(from: NSNumber(value: percent))!
    }
}
