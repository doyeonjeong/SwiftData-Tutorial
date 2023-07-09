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
    
    // TODO: 코드 입력하기
    @State private var showCreate: Bool = false
    @State private var todoEdit: Todo?
    @State private var todos: [Todo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    TodoCell(todo: todo)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    // TODO: 코드 입력하기
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                            
                            Button {
                                // TODO: 코드 입력하기
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
                    
                    // TODO: 코드 입력하기
                    
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

#Preview {
    TodoListView()
}
