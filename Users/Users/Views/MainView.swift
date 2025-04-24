//
//  MainView.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

enum UserFilter: String, CaseIterable, Codable {
    case users = "Users"
    case savedUsers = "Saved Users"
}

struct MainView: View {
    
    @State private var selectedUser: User?
    @State private var showEditView: Bool = false
    @State private var index = 0
    @State private var searchText : String = ""
    @State private var filteredUsers: [User] = [User (
        id: "",
        description: "asdasda",
        profileImage: "robert",
        name: "Robert",
        lastName: "Zeynalyan",
        phoneNumber: "+37494696633",
        country: "Kotayk marz, q.Abovyan",
        adress: "Saralanj 15",
        gender: .male,
        isSaved: true
    ), User ( id: "",
        description: "asdasda",
        profileImage: "artak",
        name: "Artak",
        lastName: "Yepremyan",
        phoneNumber: "+37455250666",
        country: "Kotayk marz, q.Abovyan",
        adress: "Hatisi 5",
        gender: .male,
        isSaved: true
    ), User (
        id: "",
        description: "asdasda",
        profileImage: "edo",
        name: "Edik",
        lastName: "Mesropyan",
        phoneNumber: "37444248025",
        country: "Kotayk marz, q.Abovyan",
        adress: "Hatisi 34",
        gender: .male,
        isSaved: true
    )]
    @State private var allUsers: [User] = [] {
        didSet {
            saveUserData()
            self.filterNotes()
        }
    }
    @State private var currentFilter: UserFilter = .users {
        didSet {
            filterNotes()
            guard let data = try? JSONEncoder().encode(currentFilter) else { return }
            UserDefaults.standard.set(data, forKey: "NotesCurrentFilterKey")
        }
    }
    
    var body: some View {
        navBar
    }
    
    private var navBar: some View {
        VStack() {
            filterMenu
            searchTextField
            Spacer()
            userList
        }
    }
    
    @ViewBuilder
    private var filterMenu: some View {
        Picker("Filter", selection: $currentFilter) {
            ForEach(UserFilter.allCases, id: \.self) { filter in
                Text(filter.rawValue).tag(filter)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.width - 30)
        .padding()
    }
    
    @ViewBuilder
    private var userList: some View {
        List {
            ForEach(filteredUsers, id: \.self) { user in
                UserDetailView(user: user)
                    .onTapGesture {
                        selectedUser = user
                        showEditView = true
                    }
            }
            .sheet(isPresented: $showEditView) {
                EditUserView(user: $selectedUser) { user in
                    
                }
            }
//            .navigationTitle("Users")
//            .sheet(isPresented: $showEditView) {
//                if let selectedUser = selectedUser {
//                    EditUserView(user: selectedUser) { updatedUserData in
//                        if let index = allUsers.firstIndex(where: { $0.id == updatedUserData.id }) {
//                            allUsers[index] = updatedUserData
//                            saveUserData()
//                        }
//                        showEditView = false
//                    }
//                }
//            }
        }
    }
    
    private var searchTextField: some View {
        TextField("  Search", text: $searchText)
            .frame(width: UIScreen.main.bounds.width - 30)
            .textFieldStyle(.roundedBorder)
    }
    
    
    
    private func createMenuRowView(_ filter: UserFilter) -> some View {
        Button {
            currentFilter = filter
        } label: {
            HStack {
                Text(filter.rawValue)
                    .font(.headline)
                Spacer()
            }
        }
        
    }
    
    private func filterNotes() {
        switch currentFilter {
        case .users:
            filteredUsers = allUsers
        case .savedUsers:
            filteredUsers = allUsers.filter { $0.isSaved }
        }
    }
}


extension MainView {
    
    func saveUserData() {
        if let encoded = try? JSONEncoder().encode(allUsers) {
            UserDefaults.standard.set(encoded, forKey: "SavedUsersKey")
        }
    }
}
