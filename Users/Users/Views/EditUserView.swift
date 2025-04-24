//
//  EditView.swift
//  Users
//
//  Created by Robert on 23.04.25.
//

import SwiftUI

struct EditUserView: View {
    
    @State var user: User
    var onSave: (User) -> Void
    
    init(user: User, onSave: @escaping (User) -> Void) {
        self.user = user
        self.onSave = onSave
    }
    
    var body: some View {
        detailPage
    }
    
    private var detailPage: some View {
        HStack(spacing: 5) {
            Button {
                print("Back")
            } label: {
                Text("Back")
            }
            Text("\(user.fullName)")
                .font(.largeTitle)
            
            Divider()
        }
    }
}
