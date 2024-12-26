//
//  JobStatusCardView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI
import SampleData

struct JobStatusCardView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Job Stats")
                    .font(.system(size: 18,weight: .bold))
                    .padding()
                Divider()
                    .frame(height: 2)
                    .background(Color.gray.opacity(0.1))
                ProgressBarView(viewModel: viewModel, height: 60)
                    .padding([.leading, .trailing], 10)
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(spacing: 15) {
                        Spacer()
                        StatusItemView(color: viewModel.getColorprogressBar(jobStatus: .yetToStart), title: JobStatus.yetToStart.getTitleName(), count: viewModel.jobCountOf(status: .yetToStart))
                        StatusItemView(color: viewModel.getColorprogressBar(jobStatus: .inProgress), title: JobStatus.inProgress.getTitleName(), count: viewModel.jobCountOf(status: .inProgress))
                        Spacer()
                    }
                    
                    HStack(spacing: 15) {
                        Spacer()
                        StatusItemView(color: viewModel.getColorprogressBar(jobStatus: .canceled), title: JobStatus.canceled.getTitleName(), count: viewModel.jobCountOf(status: .canceled))
                        StatusItemView(color: viewModel.getColorprogressBar(jobStatus: .completed), title: JobStatus.completed.getTitleName(), count: viewModel.jobCountOf(status: .completed))
                        Spacer()
                    }
                    
                    HStack(spacing: 15) {
                        Spacer()
                        StatusItemView(color: viewModel.getColorprogressBar(jobStatus: .incomplete), title: JobStatus.incomplete.getTitleName(), count: viewModel.jobCountOf(status: .incomplete))
                        Spacer()
                    }
                }
                .padding()
                
            }
            .background(Color.white)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
        }.frame(height: 200)
            .padding([.leading, .trailing])
        
        
        
    }
    
}

#Preview {
    JobStatusCardView(viewModel: ViewModel())
}
