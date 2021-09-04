//
// Created by 土田妃華 on 2021/09/02.
//

import Foundation

class Conference : Codable,Identifiable {
    var name: String
    var location: String
    var start: Date
    var end: Date?
    var link: String

    func textDates() -> String{
        var result = start.dateToString()
        if let end = self.end{
            result = "\(result) - \(end.dateToString())"
        }
        return result
    }

    init(){
        name = "Conference Name"
        location = "Location"
        start = Date()
        end = Date()
        link = "https://www.google.com"
    }
}
