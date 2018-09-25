//
//  Date+Manipulation.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 8/4/17.
//  Copyright © 2017 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension Date {
    
    var day : Int? { get { return self.components?.day; } set { if day != nil { change (day: day! + 1); } } }
    var month : Int? { get { return self.components?.month; } set { if month != nil { change (month: month! + 1); } } }
    var year : Int? { get { return self.components?.year; } set { if year != nil { change (month: year! + 1); } } }
    var hour : Int? { get { return self.components?.hour; } set { if hour != nil { change (month: hour! + 1); } } }
    var minute : Int? { get { return self.components?.minute; } set { if minute != nil { change (month: minute! + 1); } } }
    var second : Int? { get { return self.components?.second; } set { if second != nil { change (month: second! + 1); } } }
    var components : DateComponents? {
        var comps = DateComponents();
        let calendar = Calendar.current;
        
        comps.day = calendar.component(.day, from: self)
        comps.month = calendar.component(.month, from: self)
        comps.year = calendar.component(.year, from: self)
        comps.hour = calendar.component(.hour, from: self)
        comps.minute = calendar.component(.minute, from: self)
        comps.second = calendar.component(.second, from: self)
        
        return comps;
    }
    
    mutating func change (day: Int? = nil, month: Int? = nil, year: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        var comps = DateComponents();
        let calendar = Calendar.current;
        
        comps.day = day ?? calendar.component(.day, from: self)
        comps.month = month ?? calendar.component(.month, from: self)
        comps.year = year ?? calendar.component(.year, from: self)
        comps.hour = hour ?? calendar.component(.hour, from: self)
        comps.minute = minute ?? calendar.component(.minute, from: self)
        comps.second = second ?? calendar.component(.second, from: self)
        
        if let result = calendar.date(from: comps) { self = result; }
    }
    
    mutating func change (date: Date) {
        guard var comps = components else { return; }
        let calendar = Calendar.current;
        comps.day = calendar.component(.day, from: date)
        comps.month = calendar.component(.month, from: date)
        comps.year = calendar.component(.year, from: date)
        if let result = calendar.date(from: comps) { self = result; }
    }

    mutating func change (time: Date) {
        guard var comps = components else { return; }
        let calendar = Calendar.current;
        comps.hour = calendar.component(.hour, from: time)
        comps.minute = calendar.component(.minute, from: time)
        comps.second = calendar.component(.second, from: time)
        if let result = calendar.date(from: comps) { self = result; }
    }
    
    mutating func change (what component: Calendar.Component?, value: Int?) {
        guard let component = component, let value = value else { return; }
        self = Calendar.current.date(byAdding: component, value: value, to: self) ?? self;
    }
    
    @discardableResult
    mutating func offset (day: Int? = nil, month: Int? = nil, year: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        var comps = DateComponents();
        let calendar = Calendar.current;
        
        comps.day = calendar.component(.day, from: self) + (day ?? 0)
        comps.month = calendar.component(.month, from: self) + (month ?? 0)
        comps.year = calendar.component(.year, from: self) + (year ?? 0)
        comps.hour = calendar.component(.hour, from: self) + (hour ?? 0)
        comps.minute = calendar.component(.minute, from: self) + (minute ?? 0)
        comps.second = calendar.component(.second, from: self) + (second ?? 0)
        
        if let result = calendar.date(from: comps) { self = result; }
        return self;
    }

    var withoutTime : Date {
        let dayMonthYear: Set<Calendar.Component> = [.day, .month, .year];
        let components = NSCalendar.current.dateComponents(dayMonthYear, from: self);
        return NSCalendar.current.date(from: components)!;
    }
}
