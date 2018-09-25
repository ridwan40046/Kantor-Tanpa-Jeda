//
//  Date+String.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/4/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Date {
    
    enum ConvertType { case longDateTime; case longDate; case dateTime; case date; case time }
    func string (format: Date.ConvertType) -> String {
        let df = DateFormatter();
        switch format {
        case .longDateTime: df.dateStyle = .full; df.timeStyle = .full
        case .dateTime: df.dateStyle = .long; df.timeStyle = .short;
        case .longDate: df.dateStyle = .full; df.timeStyle = .none;
        case .date: df.dateStyle = .medium; df.timeStyle = .none;
        case .time: df.dateStyle = .none; df.timeStyle = .short;
        }
        return df.string(from: self);
    }
    
    func string (dateFormat: DateFormatter.Style, timeFormat: DateFormatter.Style) -> String {
        let df = DateFormatter();
        df.dateStyle = dateFormat;
        df.timeStyle = timeFormat;
        return df.string(from: self);
    }
    
    func string (format: String) -> String {
        let df = DateFormatter();
        df.dateFormat = format;
        return df.string(from: self);
    }
    
    var stringOfDate : String { return string (format: .date); }
    var stringOfTime : String { return string (format: .time); }
    var stringOfDateTime : String { return string (format: .dateTime); }
    
    var dayOfWeek : Int {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!;
        let myComponents = myCalendar.components(.weekday, from: self);
        let weekDay = myComponents.weekday;
        return weekDay!;
    }
    var dayOfWeekStr : String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEE";
        return dateFormatter.string(from: self);
    }
}
