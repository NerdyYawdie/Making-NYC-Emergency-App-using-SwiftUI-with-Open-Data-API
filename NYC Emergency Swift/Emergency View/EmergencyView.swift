//

import SwiftUI

struct EmergencyView: View {
    
    @StateObject var viewModel: EmergencyViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.emergencies) { emergency in
                    EmergencyRowView(viewModel: EmergencyRowViewModel(emergency: emergency))
                        .onTapGesture {
                            viewModel.selectedEmergency = emergency
                            viewModel.showSheetView.toggle()
                        }
                }
                .listStyle(.grouped)
            }
            .task {
                await viewModel.fetchEmergencies()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("🚨 Fetching Emergencies in NYC..."))
                }
            }
            .navigationTitle(Text("NYC Emergencies"))
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .sheet(isPresented: $viewModel.showSheetView) {
                if let selectedEmergency = viewModel.selectedEmergency {
                    EmergencySheetView(emergency: selectedEmergency)
                }
            }
        }
            
    }
}

#Preview {
    EmergencyView(viewModel: EmergencyViewModel())
}
