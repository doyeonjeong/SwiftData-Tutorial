//
//  TodoUpdateView.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

// MARK: 5. Bindable한 프로퍼티 사용하기

import SwiftUI

struct TodoUpdateView: View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var todo: Todo
    
    var body: some View {
        
        List {
            TextField("Name", text: $todo.title) // Bindable한 프로퍼티는 변경사항이 자동으로 반영됨
            Toggle("Important?", isOn: $todo.isImportant)
            Button("Update") {
                dismiss() // Update 버튼의 역할에 context.update 불필요
            }
        }
        .navigationTitle("Update To-Do")
    }
}

//Xcode Beta 2 기준 : Swift 컴파일러에 버그가 있습니다.
//이 버그는 다른 범위에서 매크로 확장의 가시성과 관련이 있어 Preview 전체 주석이 필요합니다.
//#Preview {
//    TodoUpdateView(todo: Todo(title: "임시"))
//           Preview에서 modelContainer의 inMemory를 true로 설정하면 메모리에만 저장됩니다.
//        .modelContainer(for: Todo.self, inMemory: true)
//}
