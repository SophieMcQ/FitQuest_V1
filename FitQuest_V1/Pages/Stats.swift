//
//  Stats.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI
import Firebase

struct Stats: View {
    
    @EnvironmentObject var user : User
    
    @State var name: String = ""
    @State var weight: String = ""
    @State var height: String = ""
    @State var age: String = ""
    
    var body: some View {
        
        VStack{
            Text("Stats")
            
            Text("Hi ") + Text(user.toString(id: "name")) + Text("!")
            
            Text("Weight: ") + Text(user.toString(id: "height"))
            Text("Height: ") + Text(user.toString(id: "weight"))
            Text("Age: ") + Text(user.toString(id: "age"))
            
        }
        
    }
}

func getStats() -> Void{
    let d = Firestore.firestore()
    d.collection("users").document(UserDefaults.standard.string(forKey: "email") ?? "")
    
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
