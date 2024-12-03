//

import Foundation

class EmergencyRowViewModel: ObservableObject {
    
    let emergency: NYCEmergency
    
    let dateFormatter = DateFormatter()
    
    init(emergency: NYCEmergency) {
        self.emergency = emergency
    }
    
    func convertDate() -> Date? {
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
        let emergencyDate = dateFormatter.date(from: emergency.date_and_time)
        return emergencyDate
    }
}
