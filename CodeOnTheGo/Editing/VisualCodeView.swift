//
//  VisualCodeView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/2/20.
//

import SwiftUI

struct VisualCodeView: View {
   // @State var codeString = "VStack {\n\nHStack {\n\nCircle()\n\nSpacer()\n\n}}"
    @State var componets = [Componets]()
    @Binding var stacks: [Stacks]
    @Binding var views: [Views]
    @Binding var view: Views
    @State var stack = true
    
    @State var segue1 = false
    @State var segue2 = false
    @State var segue3 = false
    @State var segue4 = false
    @State var segue5 = false
    @State var segue6 = false
    @State var segue7 = false
    @State var segue8 = false
    
    @State var i = 0
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .onAppear() {
                    print(stacks)
                }
            
         
                List {
                    ForEach(Array(view.stacks.enumerated()), id: \.element) { i, stack in
                    if stack.type == "VStack {" {
                    ForEach(stack.componets, id: \.self) { componet in
                        if componet.type == "Text()" {
                            Text(componet.text)
                               .foregroundColor(Color(componet.fColor))
                        }
                        if componet.type == "Spacer()" {
                            Spacer()
                        }
                        if componet.type == "Circle()" {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(Color(componet.fColor))
                        }
                        if componet.type == "Image" {
                            Image(systemName: componet.text)
                                .foregroundColor(Color(componet.fColor))
                        }
                        if componet.type == "Button" {
                            
                            Button(action: {
                               
                             
                                }) {
                                ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color(componet.bColor))
                                    .frame(height: 60)
                                    Text(componet.text)
                                    .font(.headline)
                                    .foregroundColor(Color(componet.fColor))
                            }
                            }
                        }
                        }  .onMove(perform: move)
                    .onDelete(perform: delete)
                    
                    .onLongPressGesture() {
                        self.i = i
                    }
                    } else if stack.type == "HStack {" {
                        HStack {
                            ForEach(stack.componets, id: \.self) { componet in
                                if componet.type == "Text()" {
                                    Text(componet.text)
                                       .foregroundColor(Color(componet.fColor))
                                }
                                if componet.type == "Spacer()" {
                                    Spacer()
                                }
                                if componet.type == "Circle()" {
                                    Circle()
                                        .foregroundColor(Color(componet.bColor))
                                        .frame(height: 60)
                                }
                                if componet.type == "Image" {
                                    Image(systemName: componet.text)
                                        .foregroundColor(Color(componet.fColor))
                                }
                                if componet.type == "Button" {
                                    
                                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                        ZStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(Color(componet.bColor))
                                            .frame(height: 60)
                                            Text(componet.text)
                                            .font(.headline)
                                            .foregroundColor(Color(componet.fColor))
                                    }
                                    }
                                }
                                
                        }  .onMove(perform: move)
                            .onDelete(perform: delete)
                            .simultaneousGesture(
                                LongPressGesture()
                                    
                                    .onEnded { amount in
                                        self.i = i
                                    }
                                
                              
                                
                            )
                            
                        }
                        
                    } else if stack.type == "}" {
                        
                    }
                        
            } .padding()
                  
               
            
                  
                
}
                .environment(\.editMode, .constant(.active))
               
}
      
    }

    func delete(at offsets: IndexSet) {
        view.stacks[i].componets.remove(atOffsets: offsets)
       
   
      
       }
    
    func move(from source: IndexSet, to destination: Int) {
    
        view.stacks[i].componets.move(fromOffsets: source, toOffset: destination)
       
        }
    }

