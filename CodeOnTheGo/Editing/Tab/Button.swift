//
//  Button.swift
//  MobileCoding
//
//  Created by Andreas Ink on 11/24/20.
//

import SwiftUI

struct ButtonView: View {
    @State var title = ""
    
    @Binding var view: Views
    @Binding var text: String
   
    var body: some View {
        ZStack {
            
              
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("b"))
                .shadow(color: Color("b"), radius: 3)
            Text(title)
                .foregroundColor(Color("dark"))
                .font(Font.custom("Montserrat-Black", size: 18.0))
              
        } .frame(width: 125, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
       
     
        .onTapGesture() {
            view.componets.append(Componets(id: UUID(), type: title, text: "", fColor: "white", bColor: "systemBlue", action: [""], width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data()))
            if title == "HStack {" {
              
               
                view.stacks.append(Stacks(id: UUID(), type: "HStack {", componets: [Componets(id: UUID(), type: title, text: "", fColor: "", bColor: "", action: [""], width: 0, height: 60,  firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())]))
                
                view.componets.append(Componets(id: UUID(), type: "}", text: "}", fColor: "white", bColor: "systemBlue", action: [""], width: 0, height: 60,  firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data()))
               
            } else if title == "VStack {" {
                view.stacks.append(Stacks(id: UUID(), type: "VStack {", componets: [Componets(id: UUID(), type: title, text: "", fColor: "", bColor: "", action: [""], width: 0, height: 60,  firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())]))
                view.componets.append(Componets(id: UUID(), type: "}", text: "}", fColor: "white", bColor: "systemBlue", action: [""], width: 0, height: 60,  firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data()))
                
            } else {
                if view.stacks.isEmpty {
                    
                } else {
                    view.stacks[0].componets.append(Componets(id: UUID(), type: title, text: "Text", fColor: "blue", bColor: "blue", action: [""], width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 1, foreach: [Componets](), image: Data()))
                
            }
         
            }
              
                
            }
        }
    
}


