import XCTest
@testable import YLCoreForm

final class YLCoreFormTests: XCTestCase {
    func testViewModel_answer() throws {
        let answers = [YLCFAnswer(title: "yes"), YLCFAnswer(title: "no")]
        let ylcFormVM = YLCFormViewModel(questions: [
            YLCFQuestion(title: "Are you good ?", answers: answers),
            YLCFQuestion(title: "Are you bad ?", answers: answers)
        ])
        ylcFormVM.answerCurrentQuestion(answers.first!)
        XCTAssertTrue(ylcFormVM.currentQuestionIndex == 1)
        
    }
}
