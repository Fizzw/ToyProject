//
//  StatusModel.swift
//  ToyProject
//
//  Created by 박정우 on 3/13/24.
//

import Foundation

struct Stat: Codable {
    let statId: String
    let statValue: String // statValue를 String으로 변경합니다.

    enum CodingKeys: String, CodingKey {
        case statId = "stat_id"
        case statValue = "stat_value"
    }
}

struct StatsData: Codable {
    let stat: [Stat]
}

class StatusModel {
    static let shared = StatusModel()
    var stats: [Stat] = []

    func setStats(withData data: [String: Any]) {
        do {
            if let jsonArray = data["stat"] as? [[String: Any]] {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: [])
                self.stats = try JSONDecoder().decode([Stat].self, from: jsonData)
            } else {
                print("Error: 'stat' key not found in JSON data or not in expected format")
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func getStatusString() -> String {
        var statusString = ""
        for stat in stats {
            statusString += "\(stat.statId): \(stat.statValue)\n"
        }
        return statusString
    }
    
    private init() { }
}
