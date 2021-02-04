//
//  Qs.swift
//  QuestionsWork
//
//  Created by Lee on 2021/2/2.
//
import UIKit

import Foundation

class Qna{
    internal init(question: UIImage, answer: String, select: [String] = Array<String>()) {
        self.question = question
        self.answer = answer
        self.select = select
    }
    
    
    
    let question : UIImage
    let answer : String
    var select = Array<String>()

}
