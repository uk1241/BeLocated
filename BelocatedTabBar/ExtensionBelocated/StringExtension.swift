//
//  StringExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 01/04/22.
//

import Foundation
import UIKit


extension String {
    func capitalizeFirstTwo() -> String
    {
        if self.count >= 2
        {
        let firstIndex = self.index(startIndex, offsetBy: 2)
        //return self.suffix(from: firstIndex).capitalized
           // print("My Substring", self.substring(to: firstIndex).uppercased())
        return self.substring(to: firstIndex).uppercased()
        }
        else
        {
            return "NA"
        }
    }
    
    func dateConversion(date:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date1 = dateFormatter.date(from: date)
        let date_formatter=DateFormatter()
        date_formatter.dateFormat="dd/MM/yyyy hh:mm a"
        return date_formatter.string(from: date1!)
    }
    func dateToString(date:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let date1 = dateFormatter.date(from: date)
        let date_formatter=DateFormatter()
        date_formatter.dateFormat="yyyy/MM/dd"
        return date_formatter.string(from: date1!)
    }
    
    func timeConversion(date:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date1 = dateFormatter.date(from: date)
        let date_formatter=DateFormatter()
        date_formatter.dateFormat="hh:mm a"
        return date_formatter.string(from: date1!)
    }
}
extension String{
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
}



extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy/MM/dd"

        return dateFormatter.string(from: Date())

    }
    static func getCurrentDateFormat() -> String {

           let dateFormatter = DateFormatter()

           dateFormatter.dateFormat = "dd/MM/yyyy"

           return dateFormatter.string(from: Date())

       }
    
    static func getCurrentTimeFormat() -> String
    {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "hh:mm:ss"

        return dateFormatter.string(from: Date())
    }
    static func getPreviousDateFormat() -> String
    {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let previuosDay = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: previuosDay)
    }
    
    static func previousDate() -> String
    {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let previuosDay = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        //print(thirtyDaysBeforeToday)
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy/MM/dd"

        return dateFormatter.string(from: previuosDay)
    }
    
    
    static func  sixMonthsBefore() -> String
    {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let thirtyDaysBeforeToday = Calendar.current.date(byAdding: .month, value: -6, to: today)!
        //print(thirtyDaysBeforeToday)
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: thirtyDaysBeforeToday)
    }
    
    static func  oneWeekBefore() -> String
    {
        let today = Date() //Jun 21, 2017, 7:18 PM
        let oneWeekBeforeToday = Calendar.current.date(byAdding: .day, value: -7, to: today)!
        //print(thirtyDaysBeforeToday)
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: oneWeekBeforeToday)
    }
    
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

extension String {
    func base64ToImage(_ base64String: String) -> UIImage? {
            guard let imageData = Data(base64Encoded: base64String) else { return nil }
            return UIImage(data: imageData)
        }
    func getRequestDateAsDate() -> Date{
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        formatter1.locale = Locale(identifier: "en_US_POSIX")
//        formatter1.timeZone = TimeZone(secondsFromGMT: 0)
        if let date = formatter1.date(from: self){
            return date
        }
        return Date()
    }
}

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}

extension Date
{
    func getdateToString() -> String{
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy/MM/dd"
        let dateStr = formatter1.string(from: self)
        return dateStr
    }
    func getRequestDateToString() -> String
    {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM / dd / yyyy"
        let dateStr = formatter1.string(from: self)
        return dateStr
    }
}

