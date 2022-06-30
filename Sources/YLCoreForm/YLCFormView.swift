//
//  YLCFormView.swift
//  YLCoreForm
//
//  Created by Yannis LANG on 27/06/2022.
//

import SwiftUI
import MediaPlayer

public struct YLCFormView<AnswerCell: View>: View {
    @ObservedObject var viewModel: YLCFormViewModel
    var answerCell: (YLCFAnswer) -> AnswerCell
    
    public init(
        viewModel: YLCFormViewModel,
        @ViewBuilder answerCell: @escaping (YLCFAnswer) -> AnswerCell
    ) {
        self.viewModel = viewModel
        self.answerCell = answerCell
    }
    
    public var body: some View {
        questions
    }
}

extension YLCFormView {
    var questions: some View {
        VStack{
            Text("\(viewModel.currentQuestion.title) #\(viewModel.currentQuestionIndex)")
                .font(.title)
            ForEach(viewModel.currentQuestion.answers){ answer in
                answerCell(answer)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.answerCurrentQuestion(answer)
                    }
            }
        }
    }
}

struct YLCFormView_Previews: PreviewProvider {
    static var previews: some View {
        
        YLCFormView(viewModel: YLCFormViewModel(questions: [
            YLCFQuestion(title: "Are you good ?", answers: [YLCFAnswer(title: "yes"), YLCFAnswer(title: "no")]),
            YLCFQuestion(title: "Are you bad ?", answers: [YLCFAnswer(title: "yes"), YLCFAnswer(title: "no")])
        ])) {  answer in
            Text(answer.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
        }
    }
}
