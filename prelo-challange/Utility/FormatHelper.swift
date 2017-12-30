//
//  FormatHelper.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import Foundation

class FormatHelper: NSObject {
    var dateFormatter = DateFormatter()
    var numberFormatter = NumberFormatter()
    
    override init() {
        super.init()
        setup()
    }
    
    private func setup(){
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        numberFormatter.locale = Locale(identifier: "id_ID")
        numberFormatter.numberStyle = .currency
    }
    
    func dateToString(from: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: from)
        return strDate
    }
    
    func getStringDate(from stringDate: String, withFormat dateFormat: String, toFormat stringFormat: String) -> String {
        if stringDate.isEmpty{
            return ""
        }else{
            dateFormatter.dateFormat = dateFormat
            let date = dateFormatter.date(from: stringDate)
            dateFormatter.dateFormat = stringFormat
            let strDate = dateFormatter.string(from: date!)
            return strDate
        }
    }
    
    func numberToCurrency(from: Double) -> String {
        if let formattedPrice = numberFormatter.string(from: from as NSNumber){
            return formattedPrice
        }else{
            return "Rp.-"
        }
    }
    
}
