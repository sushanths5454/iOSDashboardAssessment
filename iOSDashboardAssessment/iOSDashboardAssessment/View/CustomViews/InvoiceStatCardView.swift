//
//  InvoiceStatCardView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI
import SampleData
struct InvoiceStatCardView: View {
    var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Invoice Stats")
                    .font(.system(size: 18,weight: .bold))
                    .padding()
                Divider()
                    .frame(height: 2)
                    .background(Color.gray.opacity(0.1))
                ProgressBarView(viewModel: viewModel, height: 69, charViewMode: .invoiceStats)
                    .padding([.leading, .trailing], 10)
                VStack(alignment: .leading, spacing: 15) {
                    
                    HStack(spacing: 10) {
                        Spacer()
                        StatusItemView(color: viewModel.getProgressColorForInvoice(jobStatus: .draft), title: InvoiceStatus.draft.getTitleName(), count: viewModel.getTotalAmountOfInvoice(status: .draft), chartViewMode: .invoiceStats)
                        
                        StatusItemView(color: viewModel.getProgressColorForInvoice(jobStatus: .pending), title: InvoiceStatus.pending.getTitleName(), count: viewModel.getTotalAmountOfInvoice(status: .pending), chartViewMode: .invoiceStats)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 10) {
                        Spacer()
                        StatusItemView(color: viewModel.getProgressColorForInvoice(jobStatus: .paid), title: InvoiceStatus.paid.getTitleName(), count: viewModel.getTotalAmountOfInvoice(status: .paid), chartViewMode: .invoiceStats)
                        
                        StatusItemView(color: viewModel.getProgressColorForInvoice(jobStatus: .badDebt), title: InvoiceStatus.badDebt.getTitleName(), count: viewModel.getTotalAmountOfInvoice(status: .badDebt), chartViewMode: .invoiceStats)
                        Spacer()
                    }
                }
                .padding()
                
            }
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(4)
        }.frame(height: 200)
            .padding([.leading, .trailing])
    }
    
    func statusItem(color: Color, title: String, count: Int, chartViewMode: ChartViewMode = .jobStats) -> some View {
        HStack(spacing: 8) {
            Rectangle()
                .fill(color)
                .frame(width: 12, height: 12)
                .cornerRadius(3)
            Text( chartViewMode == .jobStats ? "\(title) (\(count))" : "\(title) ($\(count))")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray.opacity(0.7))
            
            
        }
    }
}

#Preview {
    InvoiceStatCardView(viewModel: ViewModel())
}
