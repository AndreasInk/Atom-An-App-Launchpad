//
//  ColorView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/27/20.
//

import SwiftUI

struct ColorView: View {
    @Binding var componet: Componets
    @State var b = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.systemFill))
          
        HStack {
            if b {
            Button(action: {
               
                componet.bColor = "white"

            }) {
                Circle()
                    .foregroundColor(Color("white"))
                    .overlay(
                          Circle()
                                .stroke(componet.bColor == "white" ? Color("white") : Color(.systemFill), lineWidth: 5)
                        )
                   
            }
            Button(action: {
                if b {
                componet.bColor = "black"
                } else {
                    componet.fColor = "black"
                }
            }) {
                Circle()
                    .foregroundColor(Color("black"))
                    .overlay(
                          Circle()
                                .stroke(componet.bColor == "black" ? Color("black") :  Color(.systemFill), lineWidth: 5)
                        )
            }
            Button(action: {
                if b {
                componet.bColor = "blue"
                } else {
                    componet.fColor = "blue"
                }
            }) {
                Circle()
                    .foregroundColor(Color("blue"))
                    .overlay(
                        Circle()
                              .stroke(componet.bColor == "blue" ? Color("blue") :  Color(.systemFill), lineWidth: 5)
                      )
            }
            Button(action: {
                if b {
                componet.bColor = "red"
                } else {
                    componet.fColor = "red"
                }
            }) {
                Circle()
                    .foregroundColor(Color("red"))
                    .overlay(
                          Circle()
                                .stroke(componet.bColor == "red" ? Color("red") :  Color(.systemFill), lineWidth: 5)
                        )
            }
            Button(action: {
                if b {
                componet.bColor = "green"
                } else {
                    componet.fColor = "green"
                }
            }) {
                Circle()
                    .foregroundColor(Color("green"))
                    .overlay(
                          Circle()
                                .stroke(componet.bColor == "green" ? Color("green") :  Color(.systemFill), lineWidth: 5)
                        )
            }
            
        
            
          
            } else {
                Button(action: {
                   
                    componet.fColor = "white"

                }) {
                    Circle()
                        .foregroundColor(Color("white"))
                        .overlay(
                              Circle()
                                    .stroke(componet.fColor == "white" ? Color("white") :  Color(.systemFill), lineWidth: 5)
                            )
                       
                }
                Button(action: {
                    if b {
                    componet.bColor = "black"
                    } else {
                        componet.fColor = "black"
                    }
                }) {
                    Circle()
                        .foregroundColor(Color("black"))
                        .overlay(
                              Circle()
                                    .stroke(componet.fColor == "black" ? Color("black") :  Color(.systemFill), lineWidth: 5)
                            )
                }
                Button(action: {
                    if b {
                    componet.bColor = "blue"
                    } else {
                        componet.fColor = "blue"
                    }
                }) {
                    Circle()
                        .foregroundColor(Color("blue"))
                        .overlay(
                              Circle()
                                    .stroke(componet.fColor == "blue" ? Color("blue") :  Color(.systemFill), lineWidth: 5)
                            )
                }
                Button(action: {
                    if b {
                    componet.bColor = "red"
                    } else {
                        componet.fColor = "red"
                    }
                }) {
                    Circle()
                        .foregroundColor(Color("red"))
                        .overlay(
                              Circle()
                                    .stroke(componet.fColor == "red" ? Color("red") :  Color(.systemFill), lineWidth: 5)
                            )
                }
                Button(action: {
                    if b {
                    componet.bColor = "green"
                    } else {
                        componet.fColor = "green"
                    }
                }) {
                    Circle()
                        .foregroundColor(Color("green"))
                        .overlay(
                              Circle()
                                .stroke(componet.fColor == "green" ? Color("green") :  Color(.systemFill), lineWidth: 5)
                            )
                        
                }
            }
        } .padding()


        }.padding()
    }
}
