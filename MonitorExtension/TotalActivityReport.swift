//
//  TotalActivityReport.swift
//  myDeviceActivityReportExtension
//
//  Created by Tarık Yılıkoğlu on 7.07.2022.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("Total Activity")
}

struct TotalActivityReport: DeviceActivityReportScene {
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    let content: (ActivityReport) -> TotalActivityView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> ActivityReport {
        
        var totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        let totalPickupsWithoutApplicationActivity = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalPickupsWithoutApplicationActivity
        })
        
        var longestActivity = 0.0
        var notifications = 0
        var pickups = 0
        var numOfDays = 0
        var distractedPeriod: TimeInterval = 24 * 60 * 60
        
        for await d in data {
            
            for await a in d.activitySegments{
                numOfDays += 1
                longestActivity += a.longestActivity!.duration
                for await c in a.categories {
                    for await ap in c.applications {
                        pickups += ap.numberOfPickups
                        notifications += ap.numberOfNotifications
                        
                    }
                }
            }
        }
        

        
        totalActivityDuration /= Double(numOfDays)
        longestActivity /= Double(numOfDays)
        notifications /= numOfDays
        distractedPeriod = distractedPeriod / Double(pickups) * Double(numOfDays)
        pickups += totalPickupsWithoutApplicationActivity
        pickups /= numOfDays
        
        
        
        //        let now = DateFormatter().string(from: Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!)
        
        return ActivityReport(totalDuration: totalActivityDuration, totalNotifications: notifications, pickups: pickups, longestActivity: longestActivity, distractedPeriod: distractedPeriod)
    }
}


