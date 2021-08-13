

import Foundation


struct Answer {
    var videoURL: String?
    var textAnswer: String = ""
    var upvotes: Int = 0
    var downvotes: Int = 0
    
    mutating func upVote() {
        upvotes += 1
    }
    
    mutating func downVote() {
        downvotes += 1
    }
}

struct Post: Identifiable {
    var id: Int
    var question: String
    var answers: [Answer]
    
    func getBestAnswerID() -> Int {
        var maxVote = 0
        var maxID = 0
        for index in 0..<answers.count {
            if (answers[index].upvotes > maxVote) {
                maxVote = answers[index].upvotes
                maxID = index
            }
        }
        return maxID
    }
    
    mutating func getNextBestAnswerID(watchedAnswerIndex: [Int]) -> Int {
        var maxVote = 0
        var maxID = 0
        for index in 0..<answers.count {
            if (answers[index].upvotes > maxVote && !watchedAnswerIndex.contains(index)) {
                maxVote = answers[index].upvotes
                maxID = index
            }
        }
        return maxID
    }
}

struct Topic: Identifiable {
    var id: Int
    let imageName: String
    let courseName: String
    var posts: [Post] = []
}




class TopicViewModel {
    var topics = [Topic]()
    
    init() {
        // MARK: CS
        let CSTopic = Topic(id: 0, imageName: "CS", courseName: "COMPUTER SCIENCE", posts: [
            Post(id: 0, question: "What is Structs in Swift?",
                 answers: [Answer(videoURL: "video1", textAnswer: "answer cs1", upvotes: 30, downvotes: 2),
                           Answer(videoURL: "video2", textAnswer: "tra loi", upvotes: 60, downvotes: 30),
                           Answer(videoURL: "video3", textAnswer: "answer cs3", upvotes: 10, downvotes: 23),
                           Answer(videoURL: "video4", textAnswer: "answer cs4", upvotes: 70, downvotes: 21),
                            ]),
            Post(id: 1, question: "What are Views?",
                 answers: [Answer(textAnswer: "Are one of the named types in Swift that allow you to encapsulate related properties and behaviors", upvotes: 30, downvotes: 2),
                           Answer(textAnswer: "applications", upvotes: 0, downvotes: 30),
                            ]),
            Post(id: 2, question: "What is a class?",
                 answers: [Answer(textAnswer: "C L A S S", upvotes: 30, downvotes: 2),
                           Answer(textAnswer: "answer 2", upvotes: 0, downvotes: 30),
                            ]),
            Post(id: 3, question: "Object Oriented Programming vs Functional Programming?",
                 answers: [Answer(textAnswer: "traloi 1", upvotes: 30, downvotes: 2),
                           Answer(textAnswer: "answer 2", upvotes: 0, downvotes: 30),
                            ]),
        ])
        
        //MARK: MATH
        let MathTopic = Topic(id: 1, imageName: "Phys", courseName: "PHYSICS", posts: [
            Post(id: 0, question: "What is ",
                   answers: [Answer(textAnswer: "answer cs1", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "tra loi", upvotes: 0, downvotes: 30),
                            ]),
            Post(id: 1, question: "What is a struct?",
                   answers: [Answer(textAnswer: "traloi 1", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "answer 2", upvotes: 0, downvotes: 30),
                            ]),
        ])
        
        //MARK: PHYS
        let PhysTopic = Topic(id: 2, imageName: "Chem", courseName: "CHEMISTRY", posts: [
            Post(id: 0, question: "An 80kg person A and a 60kg person B pull on opposite ends of a massless rope in a tug of war. Comparison of what forces determines who wins?",
                   answers: [Answer(textAnswer: "Friction forces. Because abc xyz", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "Hello abc", upvotes: 0, downvotes: 30),
                             ]),
            Post(id: 1, question: "Cau hoi khac",
                   answers: [Answer(textAnswer: "traloi 1", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "answer 2", upvotes: 0, downvotes: 30),
                            ]),
        ])
        
        //MARK: BIO
        let BioTopic = Topic(id: 3, imageName: "His", courseName: "HISTORY", posts: [
            Post(id: 0, question: "What are cells?",
                   answers: [Answer(textAnswer: "Cells are the basic building blocks of all living things.", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "hehe", upvotes: 0, downvotes: 30),
                            ]),
            Post(id: 1, question: "Is ionizing radiation always harmful?",
                   answers: [Answer(textAnswer: "no", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "yes, of course", upvotes: 0, downvotes: 30),
                            ]),
        ])
        
        //MARK: PHIL
        let PhilTopic = Topic(id: 4, imageName: "Geo", courseName: "GEOGRAPHY", posts: [
            Post(id: 0, question: "What is quicksort?",
                   answers: [Answer(textAnswer: "answer cs1", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "tra loi", upvotes: 0, downvotes: 30),
                            ]),
            Post(id: 1, question: "What is a struct?",
                   answers: [Answer(textAnswer: "traloi 1", upvotes: 30, downvotes: 2),
                             Answer(textAnswer: "answer 2", upvotes: 0, downvotes: 30),
                            ]),
        ])

        topics.append(CSTopic)
        topics.append(MathTopic)
        topics.append(PhysTopic)
        topics.append(BioTopic)
        topics.append(PhilTopic)
    }
    
    
}
