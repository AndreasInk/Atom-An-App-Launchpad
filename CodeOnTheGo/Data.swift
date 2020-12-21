//
//  CodeData.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/25/20.
//

import SwiftUI

struct Apps: Hashable, Codable {
    var id: UUID
    var title: String
    var views: [Views]
}
struct Views: Hashable, Codable {
    var id: UUID
    var title: String
    var stacks: [Stacks]
    var componets: [Componets]
}

struct Stacks: Hashable, Codable {
    var id: UUID
    var type: String
    var componets: [Componets]
   
}
struct Componets: Hashable, Codable {
    var id: UUID
    var type: String
    var text: String
    var fColor: String
    var bColor: String
    var action: [String]
    var width: Int
    var height: Int
    var firebasedata: [FirebaseData]
    var viewNum: Int
    var foreach: [Componets]
    var image: Data
}

struct FirebaseData: Hashable, Codable {
    var id: UUID
    
    var string1: String
    var string2: String
    var string3: String
    
    var double1: Double
    var double2: Double
    var double3: Double
    
    var bool1: Bool
    var bool2: Bool
    var bool3: Bool
    
    var aString1: [String]
    var aString2: [String]
    var aString3: [String]
    
    var aDouble1: [Double]
    var aDouble2: [Double]
    var aDouble3: [Double]
    
    var aBool1: [Bool]
    var aBool2: [Bool]
    var aBool3: [Bool]
}

struct API: Hashable, Codable {
    var id: UUID
    var key: String
    var url: String
    var query1: [String]
    var query2: [String]
    var query3: [String]
   
}
