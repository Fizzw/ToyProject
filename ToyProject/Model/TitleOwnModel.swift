//
//  TitleOwnModel.swift
//  ToyProject
//
//  Created by 박정우 on 3/17/24.
//

import Foundation

struct TitleOwn: Codable {
    let titleName: String
    let titleType: String // statValue를 String으로 변경합니다.

    enum CodingKeys: String, CodingKey {
        case titleName = "title_name"
        case titleType = "title_type"
    }
}

struct TitleData: Codable {
    let stat: [TitleOwn]
}

class TitleOwnModel {
    static let shared = TitleOwnModel()
    var titleOwns: [TitleOwn] = []

    func setTitleOwns(withData data: [String: Any]) {
        do {
            if let jsonArray = data["title"] as? [[String: Any]] {
                print("jsonArray is \(jsonArray)")
                print("jsonArray is \(type(of: jsonArray))")
                let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: [])
                self.titleOwns = try JSONDecoder().decode([TitleOwn].self, from: jsonData)
            } else {
                print("Error: 'stat' key not found in JSON data or not in expected format")
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func getStatusString() -> String {
        var titleOwnString = ""
        for titleOwn in titleOwns {
            titleOwnString += "\(titleOwn.titleName): \(titleOwn.titleType)\n"
        }
        return titleOwnString
    }
    
    private init() { }
}
