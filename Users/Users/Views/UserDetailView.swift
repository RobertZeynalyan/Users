//
//  UserCellView.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

struct UserDetailView {
    
    private var user: User
    @State private var isCompleted: Bool
    
    init(user: User, isCompleted: Bool) {
        self.user = user
        self.isCompleted = isCompleted
    }
    
    var body: some View {
        HStack {
            Image("\(user.profileImage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading) {
                Text("\(user.name)")
                    .padding(.bottom, 5)
                Text("\(user.gender), \(user.phoneNumber)")
                Text("\(user.country)")
                Text("\(user.adress)")
            }
        }
    }
}
