//
//  SocialHub.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI

struct SocialHub: View {
    @EnvironmentObject var user : User
    var body: some View {
        VStack(spacing: 30.0){
            Text("Social Hub")
                .font(.title)
                .fontWeight(.bold)
            NavigationLink(destination: DirectMessages()) {
                Text("DMs")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: GroupCenter()) {
                Text("Group Center")
                .foregroundColor(.black)
                    .font(.title3)
            }
            NavigationLink(destination: NewsFeed()) {
                Text("News Feed")
                .foregroundColor(.black)
                    .font(.title3)
            }
        }
    }
}

struct SocialHub_Previews: PreviewProvider {
    static var previews: some View {
        SocialHub()
    }
}
