//

import Foundation

struct NYCEmergency: Decodable, Identifiable {
    
    let id = UUID()
    let record_id: String
    let date_and_time: String
    let notificationtype: String
    let notification_title: String
    let email_body: String?
}
