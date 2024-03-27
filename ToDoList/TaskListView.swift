//
//  TaskListView.swift
//  ToDoList
//
//  Created by Илья Десятов on 23.03.2024.
//

import SwiftUI

struct TaskListView: View {
    //MARK: - properties
    @EnvironmentObject var vm: ViewModel
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - color of Background
                LinearGradient(
                    colors: [Color.tDBackground1,Color.tDBackground2],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    List {
                        ForEach(vm.tasks) { task in
                            Text(task.title)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            //MARK: - navigation bar
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

#Preview {
    TaskListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
