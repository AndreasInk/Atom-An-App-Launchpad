//
//  PreviewViewv2.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/28/20.
//

import SwiftUI
struct PreviewView2: View {
   // @State var codeString = "VStack {\n\nHStack {\n\nCircle()\n\nSpacer()\n\n}}"
    @State var componets = [Componets]()
    @State var stacks = [Stacks]()
    @Binding var views: [Views]
    @State var stack = true
    
    @State var segue1 = false
    @State var segue2 = false
    @State var segue3 = false
    @State var segue4 = false
    @State var segue5 = false
    @State var segue6 = false
    @State var segue7 = false
    @State var segue8 = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onAppear() {
                    print(stacks)
                }
            
            VStack {
                ForEach(Array(stacks.enumerated()), id: \.element) { i, stack in
                    if stack.type == "VStack {" {
                    ForEach(stack.componets, id: \.self) { componet in
                        if componet.type == "Text()" {
                            Text(componet.text)
                               .foregroundColor(Color(componet.fColor))
                                .padding()
                                .multilineTextAlignment(.center)
                        }
                        if componet.type == "Spacer()" {
                            Spacer()
                        }
                        if componet.type == "View" {
                            PreviewView(stacks: $views[componet.viewNum].stacks, views: $views)
                            
                        }
                        if componet.type == "Circle()" {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color(componet.fColor))
                                .padding()
                        }
                        if componet.type == "Image" {
                            Image(systemName: componet.text)
                                .foregroundColor(Color(componet.fColor))
                                .padding()
                        }
                        if componet.type == "Button" {
                            
                            Button(action: {
                                segue1 = true
                             
                                }) {
                                ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color(componet.bColor))
                                    .frame(height: 60)
                                    
                                    Text(componet.text)
                                    .font(.headline)
                                    .foregroundColor(Color(componet.fColor))
                            }
                            } .frame(height: CGFloat(componet.height))
                            .padding()
                            
                        }
                        if componet.type == "ButtonI" {
                            
                            Button(action: {
                                segue1 = true
                             
                              
                                }) {
                                ZStack {
                                //RoundedRectangle(cornerRadius: 25)
                              //      .foregroundColor(Color(componet.bColor))
                                 //   .frame(height: 60)
                                    
                                    Image(systemName: componet.text)
                                    .font(.headline)
                                    .foregroundColor(Color(componet.fColor))
                            }
                            } .frame(height: CGFloat(componet.height))
                            .padding()
                            
                        }
                        }
                    
                    } else if stack.type == "HStack {" {
                        HStack {
                            ForEach(stack.componets, id: \.self) { componet in
                                if componet.type == "Text()" {
                                    Text(componet.text)
                                       .foregroundColor(Color(componet.fColor))
                                        .padding()
                                }
                                if componet.type == "Spacer()" {
                                    Spacer()
                                }
                                if componet.type == "Circle()" {
                                    Circle()
                                        .foregroundColor(Color(componet.bColor))
                                        .frame(height: 60)
                                        .padding()
                                }
                                if componet.type == "ButtonI" {
                                    
                                    Button(action: {
                                        segue1 = true
                                     
                                        if componet.action[0] == "Segue" {
                                            if componet.action[1] == "1" {
                                                segue1 = true
                                            }
                                            if componet.action[1] == "2" {
                                                segue2 = true
                                            }
                                            if componet.action[1] == "3" {
                                                segue3 = true
                                            }
                                        }
                                        }) {
                                        ZStack {
                                        //RoundedRectangle(cornerRadius: 25)
                                      //      .foregroundColor(Color(componet.bColor))
                                         //   .frame(height: 60)
                                            
                                            Image(systemName: componet.text)
                                            .font(.headline)
                                            .foregroundColor(Color(componet.fColor))
                                    }
                                    } .frame(height: CGFloat(componet.height))
                                    .padding()
                                    
                                }
                                if componet.type == "Image" {
                                    Image(systemName: componet.text)
                                        .foregroundColor(Color(componet.fColor))
                                        .padding()
                                }
                                if componet.type == "Button" {
                                    
                                    Button(action: {
                                        if componet.action[0] == "Segue" {
                                            if componet.action[1] == "1" {
                                                segue1 = true
                                            }
                                            if componet.action[1] == "2" {
                                                segue2 = true
                                            }
                                            if componet.action[1] == "3" {
                                                segue3 = true
                                            }
                                        }
                                    }) {
                                        ZStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(Color(componet.bColor))
                                            .frame(height: 60)
                                            Text(componet.text)
                                            .font(.headline)
                                            .foregroundColor(Color(componet.fColor))
                                    }
                                    } .frame(height: CGFloat(componet.height))
                                    .padding()
                                }
                        }
                        }
                    } else if stack.type == "}" {
                        
                    }
            }
}
            if segue1 {
                PreviewView(stacks: $stacks, views: $views)
                    .onAppear() {
                        if views.count > 1 {
                        stacks = views[1].stacks
                        }
                    }
            }
            if segue2 {
                PreviewView(stacks: $stacks, views: $views)
                    .onAppear() {
                        if views.count > 2 {
                        stacks = views[2].stacks
                        }
                    }
            }
            if segue3 {
                PreviewView(stacks: $stacks, views: $views)
                    .onAppear() {
                        if views.count > 3 {
                        stacks = views[3].stacks
                    }
                    }
            }
}
      
}
}
