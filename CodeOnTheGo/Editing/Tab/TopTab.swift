//
//  TopTab.swift
//  MobileCoding
//
//  Created by Andreas Ink on 11/24/20.
//

import SwiftUI

struct TopTab: View {
    @Binding var edit: Bool
    @Binding var view: Views
   
   
    @Binding var text: String
    var body: some View {
       
        ZStack {
            
                
              //.cornerRadius(25)
               
        ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            Button(action: {
                edit = false
            }) {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundColor(Color("b"))
                    
            }

            ButtonView(title: "VStack {", view: $view, text: $text)
                
            ButtonView(title: "HStack {", view: $view, text: $text)
            
            ButtonView(title: "Spacer()", view: $view, text: $text)
            
            ButtonView(title: "ButtonI", view: $view, text: $text)
            
            ButtonView(title: "Button", view: $view, text: $text)
            
            ButtonView(title: "View", view: $view, text: $text)
            
           // ButtonView(title: "Circle()", view: $view, text: $text)
            
            ButtonView(title: "TextField()", view: $view, text: $text)
            
            ButtonView(title: "Text()", view: $view, text: $text)
            
            ButtonView(title: "Image", view: $view, text: $text)
          
           // ButtonView(title: "ForEach", view: $view, text: $text)
            
        } .padding()
       
    
    }
    }
    }
}
