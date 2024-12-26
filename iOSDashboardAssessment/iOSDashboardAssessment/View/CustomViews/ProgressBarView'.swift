//
//  ProgressBarView'.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 25/12/24.
//

import SwiftUI
import SampleData

struct ProgressBarView: View {
    @ObservedObject var viewModel: ViewModel
    var height: CGFloat
    var charViewMode: ChartViewMode = .jobStats
    var body: some View {
        VStack(spacing: 5) {
            
            HStack(spacing: 0) {
                Text( charViewMode == .jobStats ? "\(viewModel.totalTaskCount()) Jobs" : "Total Value($\(viewModel.getTotalInvoiceAmount()))")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.gray.opacity(0.7))
                Spacer()
                Text(charViewMode == .jobStats ? "\(viewModel.completedTaskCount()) of \(viewModel.totalTaskCount()) completed" : "$\(viewModel.getTotalAmountOfInvoice(status: .paid)) collected")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(charViewMode == .jobStats ? .gray.opacity(0.7) : .black.opacity(0.7))
            }
            .padding([.leading, .trailing], 10)
            
            HStack(spacing: 0) {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        switch charViewMode {
                        case .jobStats:
                            ForEach(JobStatus.allCases, id: \.self) { status in
                                Rectangle()
                                    .foregroundColor(viewModel.getColorprogressBar(jobStatus: status))
                                    .frame(width: geometry.size.width * viewModel.fetchWidthProportionOfProgressBar(jobStatus: status))
                            }
                        case .invoiceStats:
                            ForEach(InvoiceStatus.allCases, id: \.self) { status in
                                Rectangle()
                                    .foregroundColor(viewModel.getProgressColorForInvoice(jobStatus: status))
                                    .frame(width: geometry.size.width * viewModel.fetchWidthProportionOfProgressBarForInvoice(status: status))
                            }
                        }
                    }
                }
            }
            .cornerRadius(5.0)
            .padding([.leading, .trailing], 10)
            .frame(height: 20)
        }.frame(height: height)
    }
}

#Preview {
    
    ProgressBarView(viewModel:  ViewModel(), height: 79)
}

