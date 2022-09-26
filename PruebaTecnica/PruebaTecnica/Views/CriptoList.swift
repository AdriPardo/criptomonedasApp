//
//  ContentView.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 19/9/22.
//

import SwiftUI

struct CriptoList: View {
    @State var criptomonedas: [Criptomoneda] = []
    @State var isVisibleAlert: Bool = false
    @State var alertMessage: String = "Ha ocurrido un error"
    
    var body: some View {
        ZStack{
            VStack(spacing:0){
                HStack{
                    Spacer()
                    Text("Mercado")
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
            Alert(isVisible: $isVisibleAlert, content: {
                VStack(alignment: .center, spacing: 8){
                    Image(systemName: "exclamationmark.circle.fill").foregroundColor(.red)
                        .font(.system(size: 24))
                        .padding(.bottom)
                    Text(alertMessage)
                    Button("Aceptar", action: {
                        isVisibleAlert = false
                    }).padding(.top)
                }.padding()
            })
        }.onAppear(){
            getCriptomonedas()
            _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                getCriptomonedas()
            }
        }
    }
}
extension CriptoList{
    func getCriptomonedas(){
        CriptomonedasService().getCriptomonedas(onSuccess:{ response in
            if response != nil {
                criptomonedas = response!.data!
            }
        }, onError: { response in
            if response != nil {
                alertMessage = response!
                isVisibleAlert = true
            }
        })
    }
}
