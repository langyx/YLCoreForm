//
//  YLCForm.swift
//  YLCoreForm
//
//  Created by Yannis LANG on 27/06/2022.
//

import Foundation

public class YLCFormViewModel: ObservableObject {
    public init(questions: [YLCFQuestion]) {
        self.questions = questions
    }
    
    @Published var ended = false
    @Published var questions: [YLCFQuestion]
    var currentQuestionIndex = 0
    var currentQuestion: YLCFQuestion {
        questions[currentQuestionIndex]
    }
}

extension YLCFormViewModel {
    func answerCurrentQuestion(_ answer: YLCFAnswer) {
        if !ended {
            questions[currentQuestionIndex].answer(answer)
            next()
        }
    }
    
    func next() {
        let nextQuestionIndex = currentQuestionIndex + 1
        if nextQuestionIndex < questions.count {
            currentQuestionIndex = nextQuestionIndex
            self.objectWillChange.send()
        }else{
            ended = true
        }
    }
}
