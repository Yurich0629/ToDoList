//
//  ContentView.swift
//  ToDoList
//
//  Created by Илья Десятов on 22.03.2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Body
    var body: some View {
        TaskListView()
    }
}

//MARK: - Preview
#Preview {
    ContentView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
