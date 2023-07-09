//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

// MARK: 2. 컨테이너 설정하기

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {

    var body: some Scene {
        WindowGroup {
            TodoListView()
                .modelContainer(for: Todo.self) // 등록하기 원하는 스키마를 전달하여 환경을 설정합니다.
            // .modelContainer(for: [Todo.self, Tag.self]) 처럼 여러개의 스키마를 등록할 수 있습니다.
        }
    }
}
