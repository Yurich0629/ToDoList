//
//  NoTasksView.swift
//  ToDoList
//
//  Created by Илья Десятов on 27.03.2024.
//

import SwiftUI

struct NoTasksView: View {
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Spacer()
            //MARK: - Text
            Text("THERE ARE NO TASKS,\nWOULD YOU LIKE\n TO ADD?")
                .font(.title)
                .foregroundStyle(Color.tdPrimary)
                .opacity(0.5)
                .multilineTextAlignment(.center)
            
            Spacer()
            //MARK: - Add view button
            NavigationLink(destination: AddTaskView()) {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(Color.tdPrimary)
                        .opacity(0.5)
                    
                    Image(systemName: "plus")
                        .foregroundStyle(Color.toDoBackground2)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom)
        }
    }
}

//MARK: - Preview
#Preview {
    NoTasksView()
        .preferredColorScheme(.dark)
}
