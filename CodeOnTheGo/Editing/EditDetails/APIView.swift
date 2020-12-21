//
//  APIView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/2/20.
//

import SwiftUI
import Alamofire

struct APIView: View {
    @State var api = API(id: UUID(), key: "", url: "https://api.weather.gov/points/{latitude},{longitude}", query1: ["{latitude}", "30.24"], query2: ["{longitude}", "-81.38"], query3: [""])
    var body: some View {
        VStack {
            Color(.white)
                .onAppear() {
                   // api.url = api.url.replacingOccurrences(of: "DEMO_KEY", with: api.key, options: .literal, range: nil)
                    api.url = api.url.replacingOccurrences(of: api.query1[0], with: api.query1[1], options: .literal, range: nil)
                    api.url = api.url.replacingOccurrences(of: api.query2[0], with: api.query2[1], options: .literal, range: nil)
                    AF.request(api.url).response { response in
                        debugPrint(response)
                    }
                }
        }
    }
}

struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
