//
//  TodoCreateView.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

// MARK: 4. 데이터 저장하기

import SwiftUI

struct TodoCreateView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context // 데이터를 저장하기 위한 모델 컨텍스트 선언
    @State private var todo = Todo(title: "") // 저장할 타입을 @State하게 정의
    
    var body: some View {
        List {
            TextField("title", text: $todo.title)
            Toggle("Important?", isOn: $todo.isImportant)
            Button("Create") {
                withAnimation {
                    context.insert(todo) // 최종적으로 변경된 시점의 프로퍼티를 PersistentModel 타입으로 insert
                }
            }
        }
        .navigationTitle("Create To-Do")
    }
}

//Xcode Beta 2 기준 : Swift 컴파일러에 버그가 있습니다.
//이 버그는 다른 범위에서 매크로 확장의 가시성과 관련이 있어 Preview 전체 주석이 필요합니다.
//#Preview {
//    TodoCreateView()
//        // Preview에서 modelContainer의 inMemory를 true로 설정하면 메모리에만 저장됩니다.
//        .modelContainer(for: Todo.self, inMemory: true)
//}
