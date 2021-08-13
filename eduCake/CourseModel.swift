

import Foundation

struct Course: Identifiable {
    var courseName: String
    var author: String
    var courseLength: Int // in minutes
    var progressLength: Int // in minutes
    var id: Int
    
    func calculateProgressPercentage() -> Int {
        return (progressLength * 100 / courseLength) 
    }
}

struct CourseModel {
    var courses : [Course] = [
        Course(courseName: "Deep Learning", author: "Nguyen Le Bao Tran", courseLength: 1000, progressLength: 300, id: 0),
        Course(courseName: "Anti-Racism", author: "Hoang Van", courseLength: 3000, progressLength: 2800, id: 1),
        Course(courseName: "Swift for Everybody", author: "Apple", courseLength: 500, progressLength: 150, id: 2),
        Course(courseName: "Graphic Design", author: "Michael Worthington", courseLength: 900, progressLength: 123, id: 3),
        
    ]
}


