//
//  Stats.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI
import Firebase

struct Stats: View {
    
    let d = Firestore.firestore()
    @State private var name: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var age: String = ""
    
    var body: some View {
        Text("My Stats")
        
        
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
