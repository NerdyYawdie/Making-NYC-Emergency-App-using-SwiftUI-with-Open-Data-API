//

import SwiftUI

struct EmergencySheetView: View {
    
    let emergency: NYCEmergency
    
    var body: some View {
        VStack {
            Text(emergency.notification_title)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(emergency.email_body ?? "")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EmergencySheetView(emergency: NYCEmergency(record_id: "1", date_and_time: "2024-11-24T10:20:00.000", notificationtype: "Transportation", notification_title: "Road Reopened - Cross Bronx Expwy", email_body: "Notification issued 11-24-2024 at 10:20 AM.     Following a prior closure, all lanes of the Cross Bronx Expressway have reopened at Ellis Avenue in the Bronx. Expect residual delays.    To view this message in American Sign Language (ASL), ???????, ??????, ??, Français, Kreyòl Ayisyen, Italiano, ???, Polski, P??????, Español, ???? or ?????? : http://on.nyc.gov/2shvDYi."))
}
