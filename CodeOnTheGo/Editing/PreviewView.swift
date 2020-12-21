//
//  ContentView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/25/20.
//

import SwiftUI

struct PreviewView: View {
   // @State var codeString = "VStack {\n\nHStack {\n\nCircle()\n\nSpacer()\n\n}}"
    @State var componets = [Componets]()
    @Binding var stacks: [Stacks]
    @Binding var views: [Views]
    @State var stack = true
    @State var editStacks = [Stacks]()
    @State var segue1 = false
    @State var segue2 = false
    @State var segue3 = false
    @State var segue4 = false
    @State var segue5 = false
    @State var segue6 = false
    @State var segue7 = false
    @State var segue8 = false
    @State var text = ""
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onAppear() {
                    print(stacks)
                    for stack in stacks {
                        editStacks.append(stack)
                    }
                }
            
            VStack {
                ForEach(Array(stacks.enumerated()), id: \.element) { i1, stack in
                    if stack.type == "VStack {" {
                        ForEach(Array(stack.componets.enumerated()), id: \.element) { i, componet in
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
                       // if componet.type == "Circle()" {
                        //    Circle()
                          //      .frame(width: 50)
                            //    .foregroundColor(Color(componet.fColor))
                            //    .padding()
                      //  }
                        if componet.type == "Image" {
                            Image(systemName: componet.text)
                                .font(componet.height > 60 ? .largeTitle : .headline)
                                .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
                                .foregroundColor(Color(componet.fColor))
                                .padding()
                        }
                      // if componet.type == "TextField()" {
                         //   TextField("Placeholder", text: $editStacks[i1].componets[i].text)
                           
                               // .foregroundColor(Color(componet.fColor))
                                //.padding()
                               
                      //  }
                        if componet.type == "Button" {
                            
                            Button(action: {
                              
                                if componet.action.isEmpty {
                                    
                                } else {
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
                            if componet.type == "Image()" {
                                Image(systemName: componet.text)
                                    .font(componet.height > 60 ? .largeTitle : .headline)
                                    .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
                            }
                        if componet.type == "ButtonI" {
                            
                            Button(action: {
                              
                                if componet.action.isEmpty {
                                    
                                } else {
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
                                }
                                }) {
                                ZStack {
                                //RoundedRectangle(cornerRadius: 25)
                              //      .foregroundColor(Color(componet.bColor))
                                 //   .frame(height: 60)
                                    
                                    Image(systemName: componet.text)
                                        .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
                                        .font(componet.height > 60 ? .largeTitle : .headline)
                                    .foregroundColor(Color(componet.fColor))
                            }
                            } .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
                            .padding()
                            
                        }
                        }
                    
                    } else if stack.type == "HStack {" {
                        HStack {
                            ForEach(Array(stack.componets.enumerated()), id: \.element) { i, componet in
                                if componet.type == "Text()" {
                                    Text(componet.text)
                                       .foregroundColor(Color(componet.fColor))
                                        .padding()
                                }
                                if componet.type == "Spacer()" {
                                    Spacer()
                                }
                              //  if componet.type == "Circle()" {
                                   // Circle()
                                      //  .foregroundColor(Color(componet.bColor))
                                     //   .frame(height: 60)
                                      //  .padding()
                              //  }
                                if componet.type == "TextField()" {
                                    TextField("Placeholder", text: $editStacks[i1].componets[i].text)
                                   
                                        .foregroundColor(Color(componet.fColor))
                                        .padding()
                                }
                                if componet.type == "ButtonI" {
                                    
                                    Button(action: {
                                        segue1 = true
                                        if componet.action.isEmpty {
                                            
                                        } else {
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
                                            
                                        }
                                        }) {
                                        ZStack {
                                        //RoundedRectangle(cornerRadius: 25)
                                      //      .foregroundColor(Color(componet.bColor))
                                         //   .frame(height: 60)
                                            
                                            Image(systemName: componet.text)
                                                .font(componet.height > 60 ? .largeTitle : .headline)
                                            .foregroundColor(Color(componet.fColor))
                                    }
                                    } .frame(height: CGFloat(componet.height))
                                    .padding()
                                    
                                }
                                if componet.type == "Image" {
                                    Image(systemName: componet.text)
                                        .font(componet.height > 60 ? .largeTitle : .headline)
                                        .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
                                        .foregroundColor(Color(componet.fColor))
                                        .padding()
                                }
                                if componet.type == "Button" {
                                    
                                    Button(action: {
                                        if componet.action.isEmpty {
                                            
                                        } else {
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
                                    } .frame(width: CGFloat(componet.height), height: CGFloat(componet.height))
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
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
