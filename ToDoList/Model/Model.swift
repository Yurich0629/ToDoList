//
//  Model.swift
//  ToDoList
//
//  Created by Илья Десятов on 23.03.2024.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
