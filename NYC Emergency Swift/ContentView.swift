//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EmergencyView(viewModel: EmergencyViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "lightbulb")
                        
                        Text("Emergency")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
