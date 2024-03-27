//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct EditTaskView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    
    var task: TaskModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text("Edit task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .frame(width: 56)
                                .foregroundStyle(Color.tDAccent)
                        }
                    }
                    .padding(.vertical)
            }
            //MARK: - TextField
            CustomTextField(placeholder: "Edit your task")
            
            //MARK: - Edit Task Button
            CustomButton(titleButton: "Save") {
                vm.updateTask(id: task.id, title: vm.newTask)
            }
            
            Spacer()
        }
        .padding()
        .background(
            BackgroundView()
        )
        .onAppear {
            vm.newTask = task.title
        }
    }
}

//MARK: - Preview
#Preview {
    EditTaskView(task: TaskModel(title: "Task 1"))
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
