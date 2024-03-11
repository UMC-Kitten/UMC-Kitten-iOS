//
//  Date+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import Foundation

public extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < minute {
            return "\(secondsAgo)초 전"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute)분 전"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour)시간 전"
        } else if secondsAgo < week {
            return "\(secondsAgo / day)일 전"
        } else {
            return "\(secondsAgo / week)주 전"
        }
    }
}
