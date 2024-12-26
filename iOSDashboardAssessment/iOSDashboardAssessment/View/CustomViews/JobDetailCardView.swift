//
//  JobDetailCardView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI
import SampleData
struct JobDetailCardView: View {
    var job: JobApiModel
    var body: some View {
        
        //MARK: Username and Date View
        VStack {
            VStack(alignment: .leading, spacing: 5){
                Text("#\(job.jobNumber)")
                    .padding(.leading, 20)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.top, 15)
                
                Text("\(job.title)")
                    .padding(.top, 8)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20)
                    .lineLimit(1)
                    .font(.system(size: 19, weight: .semibold))
                Text("\(Utility.getDateInRequiredFormat(date: job.startTime)), \(Utility.formattedTime(date: job.startTime, includeAMPM: false)) - \(Utility.formattedTime(date: job.endTime, includeAMPM: true))")
                    .padding(.leading, 20)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .bold))
                    .padding(.bottom, 20)
                
            }
            .background(Color.white)
            //.frame(height: 80)
            .frame( maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
                    .shadow(color: .gray, radius: 10)
            )
    
            
        }
        
    }
}

//#Preview {
//    JobDetailCardView(job: nil)
//}
