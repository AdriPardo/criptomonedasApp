//
//  CriptoListRow.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 20/9/22.
//

import SwiftUI

struct CriptoListRow: View {
    var criptomoneda: Criptomoneda?
    var body: some View {
        ZStack{
            HStack{
                Text(criptomoneda?.symbol?.uppercased() ?? "").bold()
                Spacer()
                HStack{
                    Spacer()
                    Text(criptomoneda?.priceUsd?.setFormattedPrice() ?? "")
                    HStack{
                        Text(criptomoneda?.changePercent24Hr?.setFormattedPercentage() ?? "").foregroundColor(.white).padding(6).background(Color(setColorPercentage() ? .systemGreen : .red)).cornerRadius(24)
                    }.frame(minWidth: 100, alignment: .trailing
                    )
                }
            }.padding()
        }
    }
}
extension CriptoListRow{
    func setColorPercentage()->Bool{
        if ((criptomoneda!.changePercent24Hr!.starts(with: "-"))){
            return false
        }else{
            return true
        }
    }
    func setArrow()->String{
        if ((criptomoneda!.changePercent24Hr!.starts(with: "-"))){
            return "arrow.down"
        }else{
            return "arrow.up"
        }
    }
}

