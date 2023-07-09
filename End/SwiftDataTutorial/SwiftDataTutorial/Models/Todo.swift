//
//  Todo.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

// MARK: 1. 모델 정의하기

import Foundation
import SwiftData // 1-1. SwiftData import하기

@Model // 1-2. Model 클래스 생성하기
final class Todo {
    var title: String
    var isDone: Bool
    var isImportant: Bool
    let timestamp: Date
    
    init(title: String, isDone: Bool = false, isImportant: Bool = false) {
        self.title = title
        self.isDone = isDone
        self.isImportant = isImportant
        self.timestamp = .now
    }
}
