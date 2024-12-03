//

import SwiftUI

struct EmergencyRowView: View {
    
    @StateObject var viewModel: EmergencyRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.emergency.notification_title)
                .font(.title3)
                .bold()
                .padding(.bottom, 5)
            
            Text(viewModel.emergency.email_body ?? "")
                .lineLimit(2)
                .padding(.bottom)
            
            HStack(alignment: .top) {
                Text(viewModel.emergency.notificationtype)
                    .font(.callout)
                    .padding(5)
                    .background(Color.green)
                    .cornerRadius(4)
                
                Spacer()
                
                if let emergencyDate = viewModel.convertDate() {
                    Text(emergencyDate, style: .date)
                        .foregroundStyle(.secondary)
                        .font(.callout)
                }
            }
        }
    }
}

#Preview {
    EmergencyRowView(viewModel: EmergencyRowViewModel(emergency: NYCEmergency(record_id: "1", date_and_time: "2024-11-24T10:20:00.000", notificationtype: "Transportation", notification_title: "Road Reopened - Cross Bronx Expwy", email_body: "Notification issued 11-24-2024 at 10:20 AM.     Following a prior closure, all lanes of the Cross Bronx Expressway have reopened at Ellis Avenue in the Bronx. Expect residual delays.    To view this message in American Sign Language (ASL), ???????, ??????, ??, Français, Kreyòl Ayisyen, Italiano, ???, Polski, P??????, Español, ???? or ?????? : http://on.nyc.gov/2shvDYi.")))
        .padding()
}
