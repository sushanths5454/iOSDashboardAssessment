//
//  File.swift
//  
//
//  Created by SabariZuper on 15/05/24.
//

import Foundation

public struct JobApiModel {
    public let id = UUID()
    public let jobNumber: Int
    public let title: String
    public let startTime: String
    public let endTime: String
    public let status: JobStatus
}

public enum JobStatus: CaseIterable {
    case yetToStart, inProgress, canceled, completed, incomplete
    
    public func getTitleName() -> String {
        switch self {
        case .yetToStart:
            return "Yet to start"
        case .inProgress:
            return "In-Progress"
        case .canceled:
            return "Cancelled"
        case .completed:
            return "Completed"
        case .incomplete:
            return "In-Complete"
        }
    }
}
