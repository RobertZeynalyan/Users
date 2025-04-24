//
//  UserCellView.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

struct UserDetailView: View {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Image("\(user.profileImage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(16)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("\(user.fullName)")
                    .padding(.bottom, 5)
                VStack(alignment: .leading) {
                    Text("\(user.gender), \(user.phoneNumber)")
                    Text("\(user.country)")
                    Text("\(user.adress)")
                }
                .foregroundColor(.init(.lightGray))
            }
        }
    }
}
