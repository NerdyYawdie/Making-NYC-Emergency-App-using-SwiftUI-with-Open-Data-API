//

import Foundation


protocol EmergencyServices {
    func fetchEmergencies() async throws -> [NYCEmergency]
}

enum NYCEmergencyError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
    
    var errorTitle: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .custom(let error):
            return "Something went wrong!\n \(error)"
        }
    }
}

class EmergencyServicesImpl: EmergencyServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/8vv7-7wx3.json?$limit=100"
    
    func fetchEmergencies() async throws -> [NYCEmergency] {
        
        guard let url = URL(string: endpoint) else {
            throw NYCEmergencyError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw NYCEmergencyError.invalidResponse
            }
            
            do {
                let emergencies = try JSONDecoder().decode([NYCEmergency].self, from: data)
                return emergencies
            } catch {
                throw NYCEmergencyError.custom(error.localizedDescription)
            }
            
            
        } catch {
            throw NYCEmergencyError.custom(error.localizedDescription)
        }

    }
}

