//
//  SelectedView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/25/20.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore
struct SelectedView: View {
    @Binding var views: [Views]
    @Binding var view: Views
    @State var share = false
    @State var code = ""
    @Binding  var preview: Bool
    @State var i = 0
    @State var i2 = 0
    @Binding var text: String
    @State var details = false
    @State var componet = Componets(id: UUID(), type: "", text: "", fColor: "", bColor: "", action: [""], width: 0, height: 60,  firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())
    @State private var bgColorF = Color.white
    @State private var bgColorB = Color(.systemBlue)
    @Binding var app: Apps
    @EnvironmentObject var userData: UserData
    var body: some View {
        GeometryReader { geo in
        ZStack {
           
        VStack {
            List {
               
              
                   
                ForEach(Array(view.componets.enumerated()), id: \.element) { i, componet in
                            ZStack {
                            if componet.type == "Text()" {
                                Text("Text()")
                            }
                            if componet.type == "Spacer()" {
                                Text("Spacer()")
                            }
                          //  if componet.type == "Circle()" {
                             //   Text("Circle()")
                           // }
                                if componet.type == "View" {
                                    Text("\(componet.text)()")
                                }
                                if componet.type == "TextField" {
                                    Text("TextField()")
                                }
                                if componet.type == "Image" {
                                    Text("Image")
                                }
                            if componet.type == "VStack {" {
                                Text("VStack {")
                            }
                            if componet.type == "HStack {" {
                                Text("HStack {")
                            }
                            
                                if componet.type == "ButtonI" {
                                    Text("ButtonI")
                                }
                                if componet.type == "Button" {
                                    Text("Button")
                                }
                              //  if componet.type == "ForEach" {
                                   // Text("ForEach")
                               // }
                                if componet.type == "}" {
                                    Text("}")
                                }
                            } .onTapGesture(count: 2) {
                            self.componet = componet
                            details = true
                                self.i2 = i
                        }
                        }
        
              
        
                
                
                .onMove(perform: move)
                .onDelete(perform: delete)
                
                        
            }
            .environment(\.editMode, .constant(.active))
           
            HStack {
                Spacer()
            Button(action: {
                view.stacks.removeAll()
                i = 0
             sync()
              
                preview.toggle()
            }) {
                Image(systemName: "apps.iphone")
                    .foregroundColor(Color("b"))
            }.padding()
               
            Button(action: {
                if !share  {
                processForExport()
                }
                share.toggle()
                
            }) {
                Image(systemName: "shippingbox")
                    .foregroundColor(Color("b"))
            }
            } .padding()
           
        }
        .sheet(isPresented: $share) {
            ShareSheet(activityItems: [code])
                }
            
            
            if details {
                DetailsView(componet: $componet, details: $details, stacks: $view.stacks,  componets: $view.componets, i: $i, i2: $i2, views: views, view: $view, app: $app)
                
            }
        }
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
                if view.stacks.isEmpty {
                    
                } else {
                view.stacks[view.stacks.count - 1].componets.append(componet)
        }
            }
            print(componet)
        
        }
    }
    func processForExport() {
        do {
            let db = Firestore.firestore()
            try db.collection("users" + "/" + userData.userID + "/" + "apps").document(app.id.uuidString).setData(from: app)
        } catch let error {
            print("Error writing website to Firestore: \(error)")
        }
        code.removeAll()
        code.append("import SwiftUI\n\nstruct \("Example"): View {\n\nvar body: some View {\n\n")
        for v in view.componets {
    
            if v.type == "VStack {" {
                code.append("VStack {\n\n")
            }
            if  v.type == "}" {
                code.append("}")
            }
            if v.type == "HStack {" {
                code.append("HStack {\n\n")
            }
            if v.type == "Button" {
                
                code.append("Button(action: {\n\n}) {\n\nZStack {\nRoundedRectangle(cornerRadius: 25)\n.frame(height: 60)\n.foregroundColor(Color(\"\(v.bColor)\"))\nText(\"\(v.text)\")\n.foregroundColor(Color(\"\(v.fColor)\"))\n}.padding()\n")
            }
            if v.type == "ButtonI" {
                
                code.append("Button(action: {\n\n}) {\n\nZStack {\nImage(systemName: \(v.text))\n.foregroundColor(Color(\"\(v.bColor)\"))\n.foregroundColor(Color(\"\(v.fColor)\"))\n}.padding()\n")
            }
            if v.type == "View" {
                
                
                
            }
            if v.type == "Spacer()" {
                
                code.append("Spacer()\n\n")
            }
            if v.type == "Image" {
                code.append("Image(systemName: \"\(v.text)\")\n\n")
                
            }
            if v.type == "Text()" {
                code.append("Text(\(v.text)\n\n")
            }
           
            }
        code.append("}\n}\n}")
        }
    
    func delete(at offsets: IndexSet) {
        view.componets.remove(atOffsets: offsets)
       
   
      
       }
    
    func move(from source: IndexSet, to destination: Int) {
    
        view.componets.move(fromOffsets: source, toOffset: destination)
       
        }
    }

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
