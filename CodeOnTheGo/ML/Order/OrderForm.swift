//
//  OrderForm.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/5/20.
//

import SwiftUI

struct OrderForm: View {
    @State var description = "Description"
    @State var categories = ["Tree"]
    @Binding var settings: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("black"), Color("dark")]), startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    
                    Button(action: {
                        settings.toggle()
                    }) {
                        
                        ZStack {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("b"))
                                
                        }.padding()
                        
                        
                    }
                    Spacer()
                }
                LeadingText(text: "Custom ML Model")
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-Bold", size: 22.0))
                    .padding(.bottom, 44)
                    .padding(.horizontal)
            LeadingText(text: "Model Name")
                .font(Font.custom("Montserrat-SemiBold", size: 20.0))
                .padding()
            TextField("Model Name", text:  $description)
                .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-SemiBold", size: 12.0))
                .opacity(0.7)
                .padding(.vertical)
                .padding(.horizontal)
            LeadingText(text: "Model Description")
                .font(Font.custom("Montserrat-SemiBold", size: 20.0))
                .padding()
            TextField("Description", text:  $description)
                .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-SemiBold", size: 12.0))
                .opacity(0.7)
                .padding(.vertical)
                .padding(.horizontal)
            VStack {
            LeadingText(text: "Images")
                .font(Font.custom("Montserrat-SemiBold", size: 20.0))
                
                ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack {
                       
                        TextField(categories[0], text:  $categories[0])
                            .font(Font.custom("Montserrat-SemiBold", size: 12.0))
                            .foregroundColor(Color("light"))
                            .padding(.horizontal)
                            .background( RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color("dark"))
                                            .frame(height: 30))
                    }
                }
                Button(action: {
                    categories.append("New")
                }) {
                    ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("dark"))
                        .frame(width: 60, height: 30)
                    Image(systemName: "plus")
                        .foregroundColor(Color("b"))
                }
                }
                }
                }
            }  .padding(.horizontal)
                Spacer()
                Button(action: {
                    
                }) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 60)
                            .foregroundColor(Color("b"))
                            .shadow(color: Color("b"), radius: 3)
                        Text("Confirm Order")
                            .foregroundColor(Color("dark"))
                            .font(Font.custom("Montserrat-Black", size: 18.0))
                    }
                }.padding()
            }
         
    }
    }
}

