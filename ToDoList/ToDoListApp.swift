//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Илья Десятов on 22.03.2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    //MARK: - Properties
    @AppStorage("isDarkMode") private var isDarkMode = true
    @StateObject var vm = ViewModel()
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark: .light)
        }
    }
}
