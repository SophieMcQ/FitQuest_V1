import SwiftUI


struct ContentView : View {
 
    var body: some View {
        
        NavigationView {
            VStack {
                Color.blue.ignoresSafeArea()
                    .overlay(
                        VStack(spacing: 0.0){
                            Text("Fit Quest")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                            
                            HStack{
                                Spacer()
                                NavigationLink(destination: LoginView()) {
                                    Text("Enter")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                    }
                                Spacer()
                    
                            }
                        Spacer()
                        }
                    )
                }
          }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
