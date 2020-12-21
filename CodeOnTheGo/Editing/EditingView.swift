//
//  EditingView.swift
//  MobileCoding
//
//  Created by Andreas Ink on 11/24/20.
//

import SwiftUI

struct EditingView: View {
   
    @Binding var edit: Bool
    @State var view = Views(id: UUID(), title: "Test", stacks: [Stacks](), componets: [Componets]())
    @State var views = [Views]()
    @State var stacks = [Stacks]()
    @State var componets = [Componets]()
    @State var text: String = ""
    @State var preview = false
    @State var app = Apps(id: UUID(), title: "Title", views: [Views]())
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
        VStack {
            TopTab(edit: $edit, view: $view, text: $text)
                .padding(.bottom, 22)
            
            Divider()
        HStack {
           
            ViewsView(views: $views, view: $view, app: $app)
                
            Divider()
            SelectedView(views: $views, view: $view, preview: $preview, text: $text, app: $app)
            //VisualCodeView(stacks: $stacks, views: $views, view: $view)
                .frame(width: geo.size.width/1.7)
            
         //   Divider()
           
               //
        }
        }
                if preview {
                    ZStack {
                        Color(.systemBackground)
                        PreviewView(stacks: $view.stacks, views: $app.views)
                        .onTapGesture(count: 3, perform: {
                            preview.toggle()
                        })
                }
                }
            }
    }
    }
}

