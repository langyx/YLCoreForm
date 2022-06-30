//
//  YLCFQuestion.swift
//  YLCoreForm
//
//  Created by Yannis LANG on 27/06/2022.
//

import Foundation

public struct YLCFQuestion: Identifiable {
    public var id = UUID()
    var title: String
    var answers: [YLCFAnswer]
    
    private var answered: YLCFAnswer? = nil
    
    public init(title: String, answers: [YLCFAnswer]) {
        self.title = title
        self.answers = answers
    }
}

extension YLCFQuestion {
    mutating func answer(_ answer: YLCFAnswer){
        answered = answer
    }
}
