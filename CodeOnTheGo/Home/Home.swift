//
//  Home.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/6/20.
//

import SwiftUI

struct Home: View {
    @State var code = false
    @State var settings = false
    @State var profile = false
    @State var order = false
    @State var views2 = [Views(id: UUID(), title: "", stacks: [Stacks](), componets: [Componets]())]
    @State var views = [Views(id: UUID(), title: "", stacks: [Stacks](), componets: [Componets]()), Views(id: UUID(), title: "", stacks: [Stacks](), componets: [Componets]()), Views(id: UUID(), title: "", stacks: [Stacks(id: UUID(), type: "VStack {", componets: [Componets(id: UUID(), type: "ButtonI", text: "xmark", fColor: "white", bColor: "blue", action: [String](), width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())
    ])], componets: [Componets(id: UUID(), type: "Button", text: "Hello World", fColor: "white", bColor: "blue", action: [String](), width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())]), Views(id: UUID(), title: "", stacks: [Stacks](), componets: [Componets]())]
    @State var view = Views(id: UUID(), title: "", stacks: [Stacks](), componets: [Componets]())
    @State var componet = Componets(id: UUID(), type: "ButtonI", text: "xmark", fColor: "white", bColor: "blue", action: [String](), width: 0, height: 60, firebasedata: [FirebaseData](), viewNum: 0, foreach: [Componets](), image: Data())
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("black"), Color("dark")]), startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
                .onAppear() {
                    views[0].componets.append(componet)
                }
       
            ScrollView {
                
                Header(code: $code, settings: $settings, profile: $profile)
                        .ignoresSafeArea()
                        .padding(.bottom)
            LazyVStack {
                ForEach(Array(views.enumerated()), id: \.element) { i, view in
                    PreviewView2(componets: view.componets, stacks: view.stacks, views: $views2)
                        .frame(height: 700)
                        
                }
            }
            }
           
            if code {
                EditingView(edit: $code)
            }
            if settings {
                OrderMLDescription(settings: $settings, order: $order)
            }
    }
}
}


