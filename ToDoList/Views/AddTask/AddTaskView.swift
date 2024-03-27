//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct AddTaskView: View {
    //MARK: - Properties
    
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    
    //MARK: - Body
    var body: some View {
        ZStack {
            
            //MARK: - Color of Background
            BackgroundView()
            
            VStack {
                //MARK: - TextField
               CustomTextField(placeholder: "Enter your new task")
                //MARK: - Add task button
                CustomButton(titleButton: "Add Task") {
                    vm.addTask(task: vm.newTask)
                }
                .disabled(vm.newTask.isEmpty)
                
                Spacer()
            }
            .padding()
        }
        
        //MARK: - Navigation bar
        .navigationTitle("Add task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            //MARK: - Back button
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                   Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(Color.tDAccent)
                }

            }
        }
        .onAppear() {
            vm.newTask = ""
        }
    }
}

//MARK: - Preview
#Preview {
    NavigationView {
        AddTaskView()
            .preferredColorScheme(.dark)
            .environmentObject(ViewModel())
    }
}
