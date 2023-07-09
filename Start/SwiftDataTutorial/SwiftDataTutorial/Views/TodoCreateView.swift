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
    @State private var todo = Todo(title: "")
    
    var body: some View {
        List {
            TextField("title", text: $todo.title)
            Toggle("Important?", isOn: $todo.isImportant)
            Button("Create") {
                withAnimation {
                    // TODO: 코드 입력하기
                }
            }
        }
        .navigationTitle("Create To-Do")
    }
}

#Preview {
    TodoCreateView()
}
