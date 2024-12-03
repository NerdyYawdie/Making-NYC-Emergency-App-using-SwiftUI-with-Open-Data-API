//

import Foundation

class EmergencyViewModel: ObservableObject {
    
    @Published var emergencies: [NYCEmergency] = []
    @Published var selectedEmergency: NYCEmergency?
    
    @Published var isLoading: Bool = false
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var showSheetView: Bool = false
    
    let services: EmergencyServices
    
    init(services: EmergencyServices = EmergencyServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchEmergencies() async {
        
        do {
            isLoading = true
            
            emergencies = try await services.fetchEmergencies()
            
            isLoading = false
        } catch {
            isLoading = false
        
            if let customError = error as? NYCEmergencyError {
                errorMessage = customError.errorTitle
            }
            showErrorAlert.toggle()
        }
    }
}
