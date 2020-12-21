//
//  ViewsView.swift
//  MobileCoding
//
//  Created by Andreas Ink on 11/24/20.
//

import SwiftUI

struct ViewsView: View {
    @Binding var views: [Views]
    @Binding var view: Views
    @Binding var app: Apps
    @State var i = 0
    @State var i2 = 0
    @State var edit = false
    var body: some View {
        ZStack {
            
        VStack {
            HStack {
            Button(action: {
                edit.toggle()
                
            }) {
                ZStack {
                    
                    Image(systemName: edit ? "pencil" : "pencil.slash")
                        .font(.headline)
                        .foregroundColor(Color("b"))
                }
            } .padding()
            
                Spacer()
                Button(action: {
                    edit.toggle()
                    
                }) {
                    ZStack {
                        
                        Image(systemName: "abc")
                            .font(.headline)
                            .foregroundColor(Color("b"))
                    }
                } .padding()
            }
            List {
           
                ForEach(Array(app.views.enumerated()), id: \.element) { i, view in
                    Button(action: {
                        self.view = view
                         i2 = i
                    }) {
                        
                ZStack {
                   
                    Text(view.title)
                        .font(.body)
                        .frame(width: 90)
                       
                }
                    }
               
            }
                .onMove(perform: move)
                .onDelete(perform: delete)
                .onChange(of: view, perform: { value in
                
                
                i = 0
                    app.views[i2] = value
                
            })
            }
            .environment(\.editMode, edit ? .constant(.active) : .constant(.inactive))
               
            
            Spacer()
            Button(action: {
                app.views.append(Views(id: UUID(), title: "Test", stacks: [Stacks](), componets: [Componets]()))
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("b"))
                        .shadow(color: Color("b"), radius: 3)
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(Color("dark"))
                }
            } .frame(width: 100, height: 60)
            .padding()
           
        }
    }
    }
    func delete(at offsets: IndexSet) {
        app.views.remove(atOffsets: offsets)
       
   
      
       }
    
    func move(from source: IndexSet, to destination: Int) {
    
        app.views.move(fromOffsets: source, toOffset: destination)
       
        }
}

