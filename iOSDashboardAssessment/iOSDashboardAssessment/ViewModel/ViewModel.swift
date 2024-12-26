//
//  ViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 25/12/24.
//

import Foundation
import SampleData
import SwiftUI

enum ChartViewMode {
    case jobStats
    case invoiceStats
}

class ViewModel: ObservableObject {
    @Published var jobsData: [JobApiModel]?
    @Published var invoiceData: [InvoiceApiModel]?
    @Published var jobs: [JobApiModel]?
    @Published var selecteStatus: JobStatus = .yetToStart
    var userFirstName: String = "Sushanth"  // this for profile - first and last name
    var userLastName: String = "Suvarna"
    init() {
        jobsData = SampleData.generateRandomJobList(size: Int.random(in: 1 ... 50))
        invoiceData = SampleData.generateRandomInvoiceList(size: Int.random(in: 1 ... 50))
        //selectedJoblist()
    }
    
    func fetchDataOnPullToRefresh() {
        jobsData = SampleData.generateRandomJobList(size: Int.random(in: 1 ... 50))
        selectedJoblist()
    }
    
    func formattedDate(from date: Date) -> String {

        let dateFormatter = DateFormatter()
        

        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        
 
        let formattedString = dateFormatter.string(from: date)
        
        return formattedString
    }
    
    func getUserNameInRequiredFormat() -> String {
        return "Hello " + userFirstName + " " + userLastName
    }
    
    func fetchWidthProportionOfProgressBar(jobStatus: JobStatus) -> Double {
        
        if let totalCount = jobsData?.count,
           let selectedStatusCount = jobsData?.filter({ $0.status == jobStatus}).count {
            return Double(selectedStatusCount) / Double(totalCount)
        }
        return 0
    }
    
    func fetchWidthProportionOfProgressBarForInvoice(status: InvoiceStatus) -> Double {
        return Double((getTotalAmountOfInvoice(status: status))) / Double(getTotalInvoiceAmount())

    }
    
    func getColorprogressBar(jobStatus: JobStatus) -> Color {
        switch jobStatus {
        case .yetToStart:
            return getColor(red: 157, green: 168, blue: 222)
        case .inProgress:
            return getColor(red: 96, green: 215, blue: 254)
        case .canceled:
            return getColor(red: 255, green: 203, blue: 55)
        case .completed:
            return getColor(red: 78, green: 205, blue: 161)
        case .incomplete:
            return getColor(red: 211, green: 90, blue: 95)
        }
    }
    
    func getProgressColorForInvoice(jobStatus: InvoiceStatus) -> Color {
        switch jobStatus {
        case .draft:
            return getColor(red: 255, green: 203, blue: 55)
        case .pending:
            return getColor(red: 96, green: 215, blue: 254)
        case .paid:
            return getColor(red: 78, green: 205, blue: 161)
        case .badDebt:
            return getColor(red: 211, green: 90, blue: 95)
        }
    }
    
    func getColor(red: Int, green: Int, blue: Int) -> Color {
        return Color(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
        
    }
    
    func totalTaskCount() -> Int {
        return jobsData?.count ?? 0
    }
    
    func completedTaskCount() -> Int {
        return jobsData?.filter({ $0.status == .completed}).count ?? 0
    }
    
    func jobCountOf(status: JobStatus) -> Int {
        return jobsData?.filter({ $0.status == status}).count ?? 0
    }
    
    func getTotalInvoiceAmount() -> Int {
        return invoiceData?.reduce(0) { $0 + $1.total } ?? 0
    }
    
    func getTotalAmountOfInvoice(status: InvoiceStatus) -> Int {
        return invoiceData?.filter { $0.status == status }
            .reduce(0) { $0 + $1.total } ?? 0
    }
    
    func selectedJoblist() {
        jobs = jobsData?.filter({$0.status == selecteStatus})
    }
    
}
