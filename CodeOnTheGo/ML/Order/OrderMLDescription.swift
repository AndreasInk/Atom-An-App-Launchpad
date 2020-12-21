//
//  OrderMLDescription.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/5/20.
//

import SwiftUI

struct OrderMLDescription: View {
    @Binding var settings: Bool
    @Binding var order: Bool
   
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("black"), Color("dark")]), startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
        GeometryReader { geo in
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
            HStack {
            Text("Custom ML Model")
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-Bold", size: 22.0))
                Spacer()
            } .padding()
            HStack {
                OrderDetails(title: "Price", text: "$10.00")
                  
                OrderDetails(title: "Build Time", text: "24 hours")
                
                OrderDetails(title: "Rating", text: "100%")
                   
            } .padding()
                    Image("ml")
                        .resizable()
                        .frame(width: geo.size.width/2.1, height: geo.size.width/2.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        
                    Text("Order an ML Model to test in the app. Send us your images and description of the model and we’ll build it for you! If you have any questions I’d be happy to chat")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("light"))
                        .font(Font.custom("Montserrat-SemiBold", size: 14.0))
                    Spacer()
                    
                    Button(action: {
                        order.toggle()
                    }) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(height: 60)
                                .foregroundColor(Color("b"))
                                .shadow(color: Color("b"), radius: 3)
                            Text("Begin Order")
                                .foregroundColor(Color("dark"))
                                .font(Font.custom("Montserrat-Black", size: 18.0))
                        }
                    }.padding()
            
        }
        }
            if order {
                OrderForm(settings: $order)
            }
    }
       
}
}
