//
//  ContentView.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 19/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var criptomonedas: [Criptomoneda] = []
    var body: some View {
        ZStack{
            VStack(spacing:0){
                HStack{
                    Spacer()
                    Text("Criptomonedas")
                    Spacer()
                    Button(action: {
                        getCriptomonedas()
                    }, label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }).foregroundColor(.black)
                }.padding()
                Divider()
                    ScrollView{
                        ForEach(criptomonedas, id: \.id) { criptomoneda in
                            CriptoListRow(criptomoneda: criptomoneda)
                        
                        }
                    }
                
                
            }
            
                
            
        }.onAppear(){
            getCriptomonedas()
            _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                getCriptomonedas()
            }
        }
    }
}
extension ContentView{
    func getCriptomonedas(){
        CriptomonedasService().getCriptomonedas(onSuccess:{ response in
            if response != nil {
                criptomonedas = response!.data!
            }
        }, onError: {
            
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
