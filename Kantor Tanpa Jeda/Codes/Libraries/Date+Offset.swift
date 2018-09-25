//
//  Date+Offset.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/8/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Date {
    
    var age : String? { return Date().ageOffsetFrom(date: self); }
    
    func ageOffsetFrom(date: Date?, durationMode: Bool = false) -> String? {
        guard let date = date else { return nil; }
        let birthdaySet: Set<Calendar.Component> = [.day, .month, .year]
        let difference = NSCalendar.current.dateComponents(birthdaySet, from: date.withoutTime, to: self.withoutTime);
        
        guard let year = difference.year, let month = difference.month, let day = difference.day else { return nil; }
        
        let yearPostfix = year >= 2 ? "years" : "year";
        let monthPostfix = month >= 2 ? "months" : "months";
        let dayPostfix = day >= 2 ? "days" : "day";
        
        var text = "";
        if year >= 1 { text += "\(year) \(yearPostfix) "; }
        if year < 2 {
            if month >= 1 { text += "\(month) \(monthPostfix) "; }
            if month < 2 {
                text += "\(day) \(dayPostfix) ";
            }
        }
        if text != "" { text += "old"; }
        return text;
    }
    
    func offsetFrom(date: Date?, durationMode: Bool = false) -> String? {
        guard let date = date else { return nil; }
        let daySet: Set<Calendar.Component> = [.day]
        let difference = NSCalendar.current.dateComponents(daySet, from: date.withoutTime, to: self.withoutTime);
        var day = difference.day ?? 0;
        if difference.day != nil && durationMode { day += 1; }
        return "\(day) day" + (day > 1 ? "s" : "");
    }
    
    func offsetFrom(time: Date?) -> String? {
        guard let time = time else { return nil; }
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: time, to: self);
        
        let seconds = ""//"\(difference.second ?? 0)s"
        let minutes = "\(difference.minute ?? 0)m" + " " + seconds
        let hours = "\(difference.hour ?? 0)h" + " " + minutes
        let days = "\(difference.day ?? 0)d" + " " + hours
        
        if let day = difference.day, day          > 0 { return days }
        if let hour = difference.hour, hour       > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
    func elapsedFrom(time: Date?) -> String? {
        guard let time = time else { return nil; }
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: time, to: self);
        
        if let day = difference.day, day > 1 { return time.stringOfDate; }
        else if let day = difference.day, day == 1 { return "Yesterday"; }
        else if let hour = difference.hour, hour >= 1 { return "\(hour) Hour" + (hour > 1 ? "s" : ""); }
        else if let minute = difference.minute, minute > 1 { return "\(minute) Minute" + (minute > 1 ? "s" : ""); }
        else if let justNow = difference.minute, justNow == 1 { return "1 Minute"}
        else if let second = difference.second, second > 1 { return "Just Now"}
        else { return " "; }
    }
    
    
}
