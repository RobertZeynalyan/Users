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
        Divider()
        VStack(spacing: -65) {
            MapView()
            userDetailsInfo
        }
        Spacer()
        saveButton
        Spacer()
    }
    
//    Text("\(user.name.title " " + user.name.first + " " + user.name.last)")
//        .padding(.bottom, 5)
//    VStack(alignment: .leading) {
//        Text("\(user.gender), \(user.phone)")
//        Text("\(user.location.country)")
//        Text("\(user.location.street.name)")
//    }
    
    private var detailPage: some View {
        HStack(alignment: .center) {
            Text(user.name.fullName)
                .font(.title3)
        }
        .padding(.top, 20)
    }
    
    private var saveButton: some View {
        HStack {
            Button {
                print("asd")
            } label: {
                Text("Save")
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
        }
    }
    
    private var userDetailsInfo: some View {
        VStack(spacing: 15) {
            Image("edo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(65)
                .clipped()
            Text(user.name.fullName)
                .font(.title2)
            
            HStack(spacing: 200) {
                VStack(alignment: .leading,spacing: 20) {
                    Text("Gender:")
                    Text("Telephone:")
                    Text("Adress:")
                }
                .font(.caption)
                .foregroundColor(.init(white: 0.1, opacity: 0.3))
                
                VStack(alignment: .trailing, spacing: 20) {
                    Text("\(user.gender), \(user.phone)")
                    Text("\(user.location.country)")
                    Text("\(user.location.street.name)")
                }
                .font(.caption)
            }
        }
    }
}
