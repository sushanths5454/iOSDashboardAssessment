//
//  SwiftUIView.swift
//
//
//  Created by Sushanth on 25/12/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var navigateToNextScreen = false
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text("Dashboard")
                        .padding(.bottom, 10)
                        .padding(.leading, 15)
                        .font(.system(size: 27, weight: .bold))
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray.opacity(0.1))
                    
                }.frame(height: 50)
                    .background(Color.white)
                ScrollView(.vertical) {
                    ProfilecardView(userName: viewModel.getUserNameInRequiredFormat(), date: viewModel.formattedDate(from: Date()))
                        .padding(.top, 50)
                        .padding()
                        .frame(height: 60)
                    JobStatusCardView(viewModel: viewModel)
                        .padding(.top, 50)
                        .onTapGesture {
                            viewModel.selectedJoblist()
                            navigateToNextScreen = true
                            
                        }
                    InvoiceStatCardView(viewModel: viewModel)
                        .padding(.top, 20)
                    Spacer()
                }
            }.frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .padding(.top, 20)
                .navigationDestination(isPresented: $navigateToNextScreen) {
                    JobsView(viewmodel: viewModel)
                }
            
        }
    }
}

#Preview {
    DashboardView()
}
