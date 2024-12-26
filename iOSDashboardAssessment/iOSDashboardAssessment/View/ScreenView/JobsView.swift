//
//  JobsView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI
import SampleData

struct JobsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selecteStatus: JobStatus = .yetToStart
    @ObservedObject var viewmodel: ViewModel
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                }
                Text("Jobs (\(viewmodel.totalTaskCount()))")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 1)
            ProgressBarView(viewModel: viewmodel, height: 80)
            Divider()
                .frame(height: 2)
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    
                    ForEach(JobStatus.allCases, id: \.self) {
                        status in
                        JobStatusView(selectedStatus: $selecteStatus, status: status, jobCount: viewmodel.jobCountOf(status: status))
                            .onTapGesture {
                                selecteStatus = status
                                viewmodel.selecteStatus = status
                                viewmodel.selectedJoblist()
                            }
                    }
                }
            }.scrollIndicators(.hidden)
            
            List {
                
                ForEach(0 ..< (viewmodel.jobs?.count ?? 0), id: \.self) { index in
                    
                    if let job = viewmodel.jobs?[index] {
                        JobDetailCardView(job: job)
                            .listRowSeparator(.hidden)
                    }
                }
                
            }.refreshable {
                viewmodel.fetchDataOnPullToRefresh()
            }
            .listRowSeparator(.hidden)
            .listRowSeparator(.hidden)
            .listItemTint(.black)
            .listStyle(.plain)
            Spacer()
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    JobsView(viewmodel: ViewModel())
}
