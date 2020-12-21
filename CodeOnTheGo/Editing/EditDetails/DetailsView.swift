//
//  DetailsView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/28/20.
//

import SwiftUI

struct DetailsView: View {
    @Binding var componet: Componets
    @Binding var details: Bool
    @State var colors = false
    @State var imgs = false
    @State var actions = false
    @State var framing = false
    @Binding var stacks: [Stacks]
    @Binding var componets: [Componets]
    @Binding var i: Int
    @Binding var i2: Int
    @State var views = [Views]()
    @Binding var view: Views
    @Binding var app: Apps
    var body: some View {
        ZStack {
        Color(.systemBackground)
         
        VStack {
            HStack {
            Button(action: {
                details.toggle()
            }) {
                Image(systemName: "xmark")
            }
                Spacer()
            }
            Spacer()
            HStack {
        Text("Text:")
        
                TextField("Change text", text: $componet.text)
                    .onChange(of: componet.text, perform: { value in
                        stacks.removeAll()
                        
                        i = 0
                        componets[i2].text = value
                        sync()
                    })
    }
           
            HStack {
                Text("Colors")
                Spacer()
                Button(action: {
                    colors.toggle()
                }) {
                    Image(systemName: "arrow.right")
                        .rotationEffect(colors ? .degrees(90) : .degrees(0))
            }
               
                
            } .padding()
            if componet.type == "Image" {
            HStack {
                Text("Image")
                Spacer()
                Button(action: {
                    imgs.toggle()
                }) {
                    Image(systemName: "arrow.down")
            }
            
                
            } .padding()
            }
            if componet.type == "ButtonI" {
                HStack {
                    Text("Action")
                    Spacer()
                    Button(action: {
                        actions.toggle()
                    }) {
                        Image(systemName: "arrow.down")
                }
                
                    
                } .padding()
                HStack {
                    Text("Image")
                    Spacer()
                    Button(action: {
                        print("img")
                        imgs = true
                    }) {
                        Image(systemName: "arrow.down")
                }
                
                    
                } .padding()
            }
            if componet.type == "Button" {
                HStack {
                    Text("Action")
                    Spacer()
                    Button(action: {
                        actions.toggle()
                    }) {
                        Image(systemName: "arrow.down")
                }
                
                    
                } .padding()
               
            }
            ScrollView {
            if componet.type == "View" {
                VStack {
                Text("Input to...")
                    ForEach(Array(views.enumerated()), id: \.element) { i, view in
                    Button(action: {
                        componet.text = view.title
                        componets[i2].viewNum = i
                        print(i)
                        stacks.removeAll()
                        self.view = view
                        sync()
                    }) {
                        Blur()
                            .frame(width: 75, height: 75, alignment: .leading)
                        Text(view.title)
                            .font(.headline)
                    }
            }
                }
            }
           // if componet.type == "ForEach" {
                
          //  }
          //  Stepper(value: $componet.height, in: 0...1000) {
              //  Text("Height: \(componet.height)")
           // }
           // .onChange(of: componet.height, perform: { value in
            //    componets[i2].height = value
           //     sync()
           // })
            if actions {
                ActionView(componet: $componet, views: app.views)
                    .frame(height: 200)
                    .onChange(of: componet.action, perform: { value in
                        stacks.removeAll()
                        
                        i = 0
                        componets[i2].action = value
                    
                        sync()
                    })
            }
           
          FrameView(componet: $componet)
            .onChange(of: componet.height, perform: { value in
                stacks.removeAll()
                
                i = 0
                componets[i2].height = value
            
                sync()
            })
            if colors {
                Text("Background Color")
                ColorView(componet: $componet, b: true)
                Text("Foreground Color")
                ColorView(componet: $componet)
                .onChange(of: componet.fColor, perform: { value in
                    stacks.removeAll()
                    
                    i = 0
                    componets[i2].fColor = value
                
                    sync()
                })
                .onChange(of: componet.bColor, perform: { value in
                    stacks.removeAll()
                    
                    i = 0
                    componets[i2].bColor = value
                
                    sync()
                })
            }
            Spacer()
    }  .padding()
        }
        }
        if imgs {
         SymbolList(model: SymbolModel(), componet: $componet, imgs: $imgs)
            .onChange(of: componet.image, perform: { value in
                stacks.removeAll()
                
                i = 0
                componets[i2].image = value
            print(value)
                sync()
            })
     }
    }
    func sync() {
        for componet in view.componets {
            if componet.type == "HStack {" {
                view.stacks.append(Stacks(id: UUID(), type: "HStack {", componets: [Componets(id: UUID(), type: "}", text: "", fColor: "", bColor: "", action: [""], width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())]))
                //componets.remove(at: i)
               
            }
            if componet.type == "VStack {" {
                view.stacks.append(Stacks(id: UUID(), type: "VStack {", componets: [Componets(id: UUID(), type: "}", text: "", fColor: "", bColor: "", action: [""], width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())]))
              //  componets.remove(at: i)
                
            }
            if componet.type != "HStack {" || componet.type != "VStack {" {
                view.stacks[view.stacks.count - 1].componets.append(componet)
        }
            print(componet)
        
        }
    }
}
