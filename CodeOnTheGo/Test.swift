//
//  Test.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/25/20.
//

import SwiftUI

struct Example: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {
                   
                }) {
                    
                    ZStack {
                        Image(systemName: "xmark")
                            
                            .foregroundColor(Color("white"))
                    }.padding()
                    Spacer()
                }
                    Button(action: {
                        
                    }) {
                        
                        ZStack {
                            Image(systemName: "exclamationmark.circle")
                              
                                .foregroundColor(Color("white"))
                        }.padding()
                    }
                
            }
                   
            Spacer()
                        Image(systemName: "person")
                        
                        
                        
                        HStack {
                            
                            Text("Email")
                            
                            Spacer()
                            
                        }
                        HStack {
                            
                            Text("Password")
                            
                            Spacer()
                            
                        }
          
                        VStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(height: 60)
                                        .foregroundColor(Color("blue"))
                                    Text("Sign In")
                                        .foregroundColor(Color("white"))
                                }.padding()
                            }
                                Button(action: {
                                    
                                }) {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .frame(height: 60)
                                            .foregroundColor(Color("blue"))
                                        Text("Sign Up")
                                            .foregroundColor(Color("white"))
                                    }.padding()
                                }}}
                }
            
        }
    
