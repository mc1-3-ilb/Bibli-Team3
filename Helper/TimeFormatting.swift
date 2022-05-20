//
//  TimeFormatting.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 20/05/22.
//

import Foundation


func dateFormatter(date: Date) -> String {
  
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM YYYY"
    
        return dateFormatter.string(from: date)
     
}
