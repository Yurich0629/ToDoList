//
//  CustomButton.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct CustomButton: View {
    
    //MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    
    let titleButton: String
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(titleButton)
                .font(.headline)
                .padding()
                .foregroundStyle(Color.tDBackground1)
                .frame(maxWidth: .infinity)
                .background(Color.tDAccent)
                .clipShape(.buttonBorder)
        }
    }
}

//MARK: - Preview
#Preview {
    CustomButton(titleButton: "Add Task") {}
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
