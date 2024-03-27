//
//  BackgroundView.swift
//  ToDoList
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct BackgroundView: View {
    
    //MARK: - Body
    var body: some View {
        LinearGradient(
            colors: [Color.tDBackground1,Color.tDBackground2],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

//MARK: - Preview
#Preview {
    BackgroundView()
}
