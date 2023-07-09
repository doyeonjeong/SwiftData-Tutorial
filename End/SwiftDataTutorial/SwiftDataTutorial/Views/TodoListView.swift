//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by DOYEON JEONG on 2023/07/06.
//

// MARK: 3. 데이터 가져오기

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @Environment(\.modelContext) private var context
    @State private var showCreate: Bool = false
    @State private var todoEdit: Todo?
    
    @Query( // PersistentModel 타입으로 저장된 데이터를 Fetch하기 위한 PropertyWrapper
        filter: #Predicate { $0.isDone == false }, // 완료되지 않은 것만 필터링
        sort: \.title, // 제목을 기준으로 정렬(Model이 가진 Attribute로 정렬 가능)
        order: .reverse // 내림차순 정렬
    )
    private var todos: [Todo]
    //@Query private var todos: [Todo] // 정렬이나 필터링이 불필요하다면 이렇게 써도 무방합니다
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in // Query한 데이터를 전달하면
                    TodoCell(todo: todo)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    context.delete(todo) // context를 통해 데이터 삭제
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                            
                            Button {
                                todoEdit = todo // context.update 하지 않아도 변경된 데이터가 반영됨
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.purple)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem {
                    Button {
                        showCreate.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showCreate) {
                NavigationStack {
                    TodoCreateView()
                }
                .presentationDetents([.medium])
            }
            
            .sheet(item: $todoEdit, onDismiss: {
                todoEdit = nil
            }) { todo in
                TodoUpdateView(todo: todo)
            }
            
        }
    }
}

struct TodoCell: View {
    
    @Environment(\.modelContext) private var context
    var todo: Todo
    
    var body: some View {
        HStack {
            
            if todo.isImportant {
                Image(systemName: "exclamationmark.triangle")
                    .symbolVariant(.fill)
                    .foregroundColor(.red)
                    .font(.system(size: 24, weight: .bold))
            }
            
            Text(todo.title)
            
            Spacer()
            
            HStack {
                Text("\(todo.timestamp, format: Date.FormatStyle(date: .numeric, time: .omitted))")
                    .font(.callout)
                    .frame(maxWidth: 80)
                    .background(Color.lightGray)
                    .cornerRadius(8)
                
                Button {
                    todo.isDone.toggle()
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } label: {
                    Image(systemName: "checkmark")
                        .symbolVariant(.circle.fill)
                        .foregroundStyle(todo.isDone ? .green : .gray)
                        .font(.system(size: 24, weight: .bold))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 10)
    }
}

//Xcode Beta 2 기준 : Swift 컴파일러에 버그가 있습니다.
//이 버그는 다른 범위에서 매크로 확장의 가시성과 관련이 있어 Preview 전체 주석이 필요합니다.
//#Preview {
//    TodoListView()
//        // Preview에서 modelContainer의 inMemory를 true로 설정하면 메모리에만 저장됩니다.
//        .modelContainer(for: Todo.self, inMemory: true)
//}
