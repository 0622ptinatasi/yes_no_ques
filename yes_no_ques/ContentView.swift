//
//  ContentView.swift
//  yes_no_ques
//
//  Created by user12 on 2025/1/2.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Bool
}

struct ContentView: View {
    @State private var questions: [Question] = [
        Question(text: "現在是2025年？", answer: true),
        Question(text: "海洋大學在海裡嗎？", answer: false),
        Question(text: "猜猜我有沒有男朋友？", answer: true),
        Question(text: "資工女排理工盃拿第二名？", answer: false),
        Question(text: "韓國女團GFRIEND今年回歸？", answer: true),
        Question(text: "大學畢業還會留在海大嗎？", answer: false),
        Question(text: "鍾嘉欣是小笨蛋嗎？", answer: true),
        Question(text: "我今年３歲", answer: false),
        Question(text: "我一定可以去韓國！", answer: true),
        Question(text: "住家裡很開心？", answer: false)
    ]

    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showScore = false

    var body: some View {
        VStack {
            if showScore {
                VStack {
                    Text("測驗完成！")
                        .font(.largeTitle)
                        .padding()
                    Text("您的得分是 \(score) / \(questions.count)")
                        .font(.title2)
                        .padding()
                    Button("重新開始") {
                        resetQuiz()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                VStack {
                    Text("問題 \(currentQuestionIndex + 1) / \(questions.count)")
                        .font(.headline)
                        .padding()
                    Text(questions[currentQuestionIndex].text)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack {
                        Button("正確") {
                            answerQuestion(true)
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                        Button("錯誤") {
                            answerQuestion(false)
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }

    func answerQuestion(_ answer: Bool) {
        if answer == questions[currentQuestionIndex].answer {
            score += 1
        }

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showScore = true
        }
    }

    func resetQuiz() {
        currentQuestionIndex = 0
        score = 0
        showScore = false
    }
}

#Preview {
    ContentView()
}
