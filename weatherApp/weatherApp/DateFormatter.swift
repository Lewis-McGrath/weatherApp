//
//  DateFormatter.swift
//  weatherApp
//
//  Created by Lewis McGrath on 17/01/2018.
//  Copyright © 2018 Lewis McGrath. All rights reserved.
//

import Foundation

public class DateFormatterHelper {
    
    public static func weatherDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM"
        return dateFormatter
    }
    
}
