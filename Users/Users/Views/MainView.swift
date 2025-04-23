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
    
    @State private var searchText : String = ""
    @State private var filteredUsers: [User] = []
    @State private var allUsers: [User] = [] {
        didSet {
            saveNotes()
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
        VStack(spacing: -10) {
            filterMenu
            searchTextField
            Spacer()
        }
    }
    
    @ViewBuilder
    private var filterMenu: some View {
//        Menu(currentFilter.rawValue, content: {
//            ForEach(UserFilter.allCases, id: \.self){ filter in
//                return createMenuRowView(filter)
//            }
//        })
//        .tint(.black)
//        .font(.system(size: 25, weight: .semibold))
//        .pickerStyle(SegmentedPickerStyle())
//        Menu {
//            ForEach(UserFilter.allCases, id: \.self) { filter in
//                createMenuRowView(filter)
//            }
//        } label: {
//            Label(currentFilter.rawValue, systemImage: "line.3.horizontal.decrease.circle")
//                .font(.system(size: 25, weight: .semibold))
//                .foregroundColor(.black)
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(8)
//        }
        Picker("Filter", selection: $currentFilter) {
            ForEach(UserFilter.allCases, id: \.self) { filter in
                Text(filter.rawValue).tag(filter)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.width - 30)
        .padding()
    }
    
    private var searchTextField: some View {
        TextField("  Search", text: $searchText)
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(8)
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
    
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(allUsers) {
            UserDefaults.standard.set(encoded, forKey: "SavedUsersKey")
        }
    }
}
