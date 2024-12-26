//
//  StatusItemView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 26/12/24.
//

import SwiftUI

struct StatusItemView: View {
    var color: Color
    var title: String
    var count: Int
    var chartViewMode: ChartViewMode = .jobStats
    var body: some View {
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
    StatusItemView(color: .red, title: "", count: 0)
}
