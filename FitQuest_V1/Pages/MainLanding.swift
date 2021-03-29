//
//  MainLanding.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI

struct MainLanding: View {
    var body: some View {
        VStack(spacing: 30.0){
            Text("Main Landing")
                .font(.title)
                .fontWeight(.bold)
            NavigationLink(destination: SocialHub()) {
                Text("Social Hub")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: Tournament()) {
                Text("Tournament")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: Stats()) {
                Text("Stats")
                .foregroundColor(.black)
                    .font(.title3)
            }
            
            NavigationLink(destination: Settings()) {
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
