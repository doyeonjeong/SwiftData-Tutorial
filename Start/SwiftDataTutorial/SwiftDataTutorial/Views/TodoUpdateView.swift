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
    @Binding var todo: Todo
    
    var body: some View {
        
        List {
            TextField("Name", text: $todo.title)
            Toggle("Important?", isOn: $todo.isImportant)
            Button("Update") {
                dismiss()
            }
        }
        .navigationTitle("Update To-Do")
    }
}

#Preview {
    TodoUpdateView(todo: Todo(title: "임시"))
}
