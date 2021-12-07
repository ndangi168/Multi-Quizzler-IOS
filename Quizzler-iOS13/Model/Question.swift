//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Nikhil Dangi on 24/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var options: [String]
    var answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        options = a
        answer = correctAnswer
    }
}
