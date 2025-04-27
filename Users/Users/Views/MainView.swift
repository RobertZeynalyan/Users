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
    @State private var currentPage: Int = 1
    @State private var filteredUsers: [User] = []
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
        VStack {
            navBar
            searchTextField
            Spacer()
            userList
        }
        .onAppear {
            fetchUserData(page: currentPage)
        }
        .sheet(isPresented: $showEditView) {
            if let selectedUser = selectedUser {
                EditUserView(user: selectedUser) { updatedUserData in
                    if let index = allUsers.firstIndex(where: { $0.id == updatedUserData.id }) {
                        allUsers[index] = updatedUserData
                        saveUserData()
                    }
                    showEditView = false
                }
            }
        }
    }
    
    private var navBar: some View {
        Picker("Filter", selection: $currentFilter) {
            ForEach(UserFilter.allCases, id: \.self) { filter in
                Text(filter.rawValue).tag(filter)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.width - 30)
        .padding()
    }
    
    private var userList: some View {
        List {
            ForEach(filteredUsers, id: \.self) { user in
                UserDetailView(user: user)
                    .onTapGesture {
                        selectedUser = user
                        showEditView = true
                }
            }
        }
    }
    
    private var searchTextField: some View {
        TextField("Search", text: $searchText)
            .frame(width: UIScreen.main.bounds.width - 30)
            .textFieldStyle(.roundedBorder)
    }
}

private extension MainView {
    func fetchUserData(page: Int = 1, limit:Int = 20) {
        guard let url = URL(string: "https://randomuser.me/api?seed=renderforest&results=\(limit)&page=\(page)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response format")
                return
            }
            print("Response status code: \(httpResponse.statusCode)")
            print("Requested URL: \(url)")

            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(UsersResult.self, from: data)
                self.allUsers = result.results
                
            } catch {
                print("Decoding error: \(error)")
            }
        }
        
        task.resume()
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


private extension MainView {
    func saveUserData() {
        if let encoded = try? JSONEncoder().encode(allUsers) {
            UserDefaults.standard.set(encoded, forKey: "SavedUsersKey")
        }
    }
}
