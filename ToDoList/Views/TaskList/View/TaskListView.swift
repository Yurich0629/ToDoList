//
//  TaskListView.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct TaskListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @State private var isEditViewPresented = false
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                
            //MARK: - Background
                BackgroundView()
                VStack {
                    
                    if vm.tasks.isEmpty {
                        
                        //MARK: - Empty list
                        NoTasksView()
                    } else {
                        
                        //MARK: - List of tasks
                        List {
                            ForEach(vm.tasks) { task in
                                TaskRow(model: task) {
                                    vm.isCompletedTask(task: task)
                                }
                                .onTapGesture {
                                    vm.selectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform: vm.deleteTask)
                            
                            //MARK: - Edit view
                            .sheet(isPresented: $isEditViewPresented, content: {
                                if let taskToEdit = vm.selectedTask {
                                    EditTaskView(task: taskToEdit)
                                }
                            })
                        }
                        .listStyle(.plain)
                        
                        //MARK: - Progress view
                        ProgressView("Completion Task", value: vm.completionRate)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.tdPrimary)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
            
            //MARK: - Navigation bar
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.tdPrimary)
                    }
                }
            }
        }
    }
}

//MARK: - Preview
#Preview {
    TaskListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}


