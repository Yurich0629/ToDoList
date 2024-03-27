//
//  CustomTextField.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let placeholder: String
    
    //MARK: - Body
    var body: some View {
        TextField(placeholder, text: $vm.newTask)
            .font(.headline)
            .padding()
            .background(Color.tdPrimary.opacity(0.15))
            .clipShape(.buttonBorder)
    }
}

//MARK: - Preview
#Preview {
    CustomTextField(placeholder: "Enter yout new task")
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
