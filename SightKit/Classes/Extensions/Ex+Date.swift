//
//  Et+Date.swift
//  SightKit
//
//  Created by 湛奇 on 2020/9/21.
//

import Foundation

/*
enum TimeFormat:String
{
    case format_default            = "yyyy-MM-dd HH:mm:ss"
    case format_yyMdHm             = "yy-MM-dd HH:mm"
    case format_yyyyMdHm           = "yyyy-MM-dd HH:mm"
    case format_yMd                = "yyyy-MM-dd"
    case format_MdHms              = "MM-dd HH:mm:ss"
    case format_MdHm               = "MM-dd HH:mm"
    case format_Hms                = "HH:mm:ss"
    case format_Hm                 = "HH:mm"
    case format_Md                 = "MM-dd"
    case format_yyMd               = "yy-MM-dd"
    case format_YYMMdd             = "yyyyMMdd"
    case format_yyyyMdHms          = "yyyyMMddHHmmss"
    case format_yyyyMdHmsS         = "yyyy-MM-dd HH:mm:ss.SSS"
    case format_yyyyMMddHHmmssSSS  = "yyyyMMddHHmmssSSS"
    case format_yMdWithSlash       = "yyyy/MM/dd"
    case format_yM                 = "yyyy-MM"
    case format_yMdChangeSeparator = "yyyy.MM.dd"
}
*/

public extension Int {
    var date:Date {
        let timeInterval:TimeInterval = TimeInterval(self)
        let date = Date.init(timeIntervalSince1970: timeInterval/1000)
        return date
    }
}

/// 精确到秒的时间 yyyy.MM.dd HH:mm:ss
public func timeDesFromUnixtime(str:String?) -> String {
    guard let timeStr = str else { return "" }
    guard let timeInterval:TimeInterval = TimeInterval(timeStr) else { return "" }
    let date = Date.init(timeIntervalSince1970: timeInterval/1000)
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy.MM.dd HH:mm:ss" //自定义日期格式
    let time = dateformatter.string(from: date)
    
    return time
}

/// 精确到天的时间 yyyy.MM.dd
public func dayDesFromUnixtime(str:String?) -> String {
    guard let timeStr = str else { return "" }
    guard let timeInterval:TimeInterval = TimeInterval(timeStr) else { return "" }
    let date = Date.init(timeIntervalSince1970: timeInterval/1000)
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy.MM.dd" //自定义日期格式
    let time = dateformatter.string(from: date)
    
    return time
}

/// 精确到毫秒的当前时间戳
public var currentUnixTimeMinisecStr:String{
    get {
        let timeInterval = Date().timeIntervalSince1970
        let str = String(format: "%.0f", timeInterval*1000)
        return str
    }
}
/// 精确到秒的当前时间戳
public var currentUnixTimeSecStr:String{
    get {
        let timeInterval = Date().timeIntervalSince1970
        let str = String(format: "%.0f", timeInterval*1000)
        return str
    }
}

extension Date {
    
    /// 两个日期中间有几天
    func days(between otherDate: Date) -> Int {
        let calendar = Calendar.current
        
        let startOfSelf = calendar.startOfDay(for: self)
        let startOfOther = calendar.startOfDay(for: otherDate)
        let components = calendar.dateComponents([.day], from: startOfSelf, to: startOfOther)
        
        return abs(components.day ?? 0)
    }
}

// MARK: - 日期
public extension Date{
    func stringWith(format:String) -> String{
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = format
        let str = dateFormate.string(from: self)
        return str
    }
    
    ///日期字符串 yyyy-MM-dd HH:mm:ss
    var string:String{
        get {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let str = dateFormate.string(from: self)
            return str
        }
    }
    
    /// 日期字符串 yyyy-MM-dd HH:mm:ss.SSS
    var stringWithMinsecond:String{
        get {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            let str = dateFormate.string(from: self)
            return str
        }
    }
    
    /// 年份 yyyy
    var year:String{
        get {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = "yyyy"
            let str = dateFormate.string(from: self)
            return str
        }
    }
    
    /// 月份 MM
    var month:String{
        get {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = "MM"
            let str = dateFormate.string(from: self)
            return str
        }
    }
    
    /// 天 dd
    var day:String{
        get {
            let dateFormate = DateFormatter()
            dateFormate.dateFormat = "dd"
            let str = dateFormate.string(from: self)
            return str
        }
    }
}

/// 根据后台时间戳 转换为 几分钟前，几小时前，几天前
public func currentTimeDes(timeStampStr: String) -> String {
    guard let timeStamp = Double(timeStampStr) else { return "" }
    
    //获取当前的时间戳
    let currentTime = Date().timeIntervalSince1970
//    print(currentTime,   timeStamp, "sdsss")
    //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
    let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
    //时间差
    let reduceTime : TimeInterval = currentTime - timeSta
    //时间差小于60秒
    if reduceTime < 60 {
        return "刚刚"
    }
    //时间差大于一分钟小于60分钟内
    let mins = Int(reduceTime / 60)
    if mins < 60 {
        return "\(mins)分钟前"
    }
    let hours = Int(reduceTime / 3600)
    if hours < 24 {
        return "\(hours)小时前"
    }
    let days = Int(reduceTime / 3600 / 24)
    if days < 30 {
        return "\(days)天前"
    }
    //不满足上述条件---或者是未来日期-----直接返回日期
    let date = NSDate(timeIntervalSince1970: timeSta)
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss
    dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
    return dfmatter.string(from: date as Date)
}
