//
//  StatusView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI
import SampleData

struct JobStatusView: View {
    @Binding var selectedStatus: JobStatus
    var status: JobStatus
    var jobCount: Int
    var body: some View {
        VStack() {
            Text("\(status.getTitleName())(\(jobCount))")
                .padding([.leading, .trailing])
                .font(.system(size: status == selectedStatus  ? 16 : 15, weight: .bold ))
                .foregroundColor(status == selectedStatus ? .black : .black.opacity(0.7))
            Divider()
                .frame(height: 3)
                .background(status == selectedStatus  ? Color(red: 110 / 250, green: 80 / 250, blue: 170 / 250) : .white)
            
        }.frame(height: 50)
    }
}

#Preview {

    JobStatusView(selectedStatus: .constant(.canceled), status: .incomplete, jobCount: 0)
}
