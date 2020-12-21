//
//  LeadingText.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/5/20.
//

import SwiftUI

struct LeadingText: View {
    @State var text = ""
    var body: some View {
        HStack {
        Text(text)
            .foregroundColor(Color("light"))
            
            Spacer()
        }
    }
}

struct LeadingText_Previews: PreviewProvider {
    static var previews: some View {
        LeadingText()
    }
}
