//
//  Street.swift
//  Users
//
//  Created by Robert on 28.04.25.
//

struct Street: Hashable, Equatable, Codable {
    var number: Int
    let name: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = 0
        do {
            self.number = try container.decode(Int?.self, forKey: .number) ?? 0
        } catch {
            print(error)
        }
        self.name = try container.decode(String.self, forKey: .name)
    }
}
