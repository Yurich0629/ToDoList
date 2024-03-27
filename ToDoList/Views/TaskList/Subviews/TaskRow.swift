//
//  TaskRow.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct TaskRow: View {
    
    //MARK: - Properties
    var model: TaskModel
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        HStack{
            //MARK: - Title
            model.isCompleted ? Text(model.title).strikethrough().foregroundStyle(Color.tdPrimary.opacity(0.5)) : Text(model.title)
                .font(.headline)
            
            Spacer()
            
            //MARK: - Task completion toggle
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.tDAccent)
            }
            .buttonStyle(.borderless)
        }
        .font(.headline)
        .padding()
        .background(model.isCompleted ? Color.tdPrimary.opacity(0.1) :
                        Color.tdPrimary.opacity(0.25))
        .clipShape(.buttonBorder)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .padding(.vertical, 6)
    }
}

//MARK: - Preview
#Preview {
    List {
        TaskRow(model: TaskModel(title: "task 1", isCompleted: true)) {}
        TaskRow(model: TaskModel(title: "task 2", isCompleted: false)) {}
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
}
