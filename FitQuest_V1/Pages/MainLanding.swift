//
//  MainLanding.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI

struct MainLanding: View {
    
    @EnvironmentObject var user : User
    
    var body: some View {
        VStack(spacing: 30.0){
            Text("Main Landing")
                .font(.title)
                .fontWeight(.bold)
            NavigationLink(destination: SocialHub().environmentObject(user)) {
                Text("Social Hub")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: Tournament().environmentObject(user)) {
                Text("Tournament")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: Stats().environmentObject(user)) {
                Text("Stats")
                .foregroundColor(.black)
                    .font(.title3)
            }
            
            NavigationLink(destination: Settings().environmentObject(user)) {
                Text("Settings")
                .foregroundColor(.black)
                    .font(.title3)
            }
        }
    }
}

struct MainLanding_Previews: PreviewProvider {
    static var previews: some View {
        MainLanding()
    }
}
