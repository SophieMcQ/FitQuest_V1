import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Fit Quest")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.blue)
                Spacer()
                NavigationLink(destination: MainLanding()) {
                    Text("Login")
                    .padding()
                    .foregroundColor(.red)
                    .font(.title)
            }
            NavigationLink(destination: CharacterCreation()) {
                    Text("Sign In")
                    .padding()
                    .foregroundColor(.blue)
                    .font(.title)
            }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
