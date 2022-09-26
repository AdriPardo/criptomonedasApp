//
//  Alert.swift
//  PruebaTecnica
//
//  Created by Adrian Pardo Moreno on 26/9/22.
//

import SwiftUI

struct Alert<Content: View>: View/*, Equatable*/ {
    var closeButtonIsVisible: Bool = false
    var cornerRadius: Int = 20
    var draggable: Bool = true
    @Binding var isVisible: Bool
    @State var offset: CGFloat = UIScreen.main.bounds.height
    @State var opacity: CGFloat = 0
    var width: Int = 350
    @ViewBuilder let content: Content

    var body: some View {
        ZStack{
            Color.black.opacity(opacity)
            content.frame(maxWidth: CGFloat(width))
                .background(Color(.white))
                .cornerRadius(CGFloat(cornerRadius))
                .offset(x: 0, y: offset)
                .gesture(draggable ? dragGesture : nil)
        }
        .edgesIgnoringSafeArea(.all).onChange(of: isVisible, perform: { value in
            if(isVisible){
                showAlert()
            }else{
                hideAlert()
            }
        })
    }
}

extension Alert{
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged{ value in
                withAnimation(.spring()){
                    if(((-40)...).contains(value.translation.height)){
                        offset = value.translation.height
                        if((0...UIScreen.main.bounds.height/2).contains(value.translation.height)){
                            opacity = (0.5*UIScreen.main.bounds.height - value.translation.height)/UIScreen.main.bounds.height
                        }
                    }
                }
            }.onEnded{ value in
                withAnimation(.spring()){
                    if(value.translation.height>100){
                        hideAlert()
                    }else if((...100).contains(value.translation.height)){
                        showAlert()
                    }
                }
                
            }
    }
    func hideAlert(){
        withAnimation(.easeInOut(duration: 0.5)){
            offset = UIScreen.main.bounds.height
            opacity = 0
        }
        isVisible = false
    }
    func showAlert(){
        withAnimation(.spring()){
            offset = 0
            opacity = 0.5
        }
        isVisible = true
    }
    /*static func == (lhs: F2gAlert, rhs: F2gAlert) -> Bool {
        return lhs.isVisible == rhs.isVisible
    }*/
}


