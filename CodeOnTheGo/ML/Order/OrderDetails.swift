//
//  OrderDetails.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/5/20.
//

import SwiftUI

struct OrderDetails: View {
    @State var title = ""
    @State var text = ""
    var body: some View {
        VStack {
            HStack {
            Text(title)
               
                .opacity(0.7)
                .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-SemiBold", size: 12.0))
                Spacer()
            }
            HStack {
            Text(text)
                
                    .foregroundColor(Color("light"))
                .font(Font.custom("Montserrat-SemiBold", size: 14.0))
                Spacer()
        }
        }
    }
}

struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails()
    }
}
