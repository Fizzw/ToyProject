//
//  TitleEquipmentModel.swift
//  ToyProject
//
//  Created by 박정우 on 3/11/24.
//

import Foundation

class TitleEquipmentModel {
    
    static let shared = TitleEquipmentModel()
    var titleEquipmentDict: [String: Any]?
    
    struct TitleData: Codable {
        let titleEquipmentTypeName: String
        let titleName: String
        let titleType: String

        enum CodingKeys: String, CodingKey {
            case titleEquipmentTypeName = "title_equipment_type_name"
            case titleName = "title_name"
            case titleType = "title_type"
        }
    }
    
    var titleEquipmentArray: [TitleData]? {
        guard let titleEquipmentModel = titleEquipmentDict,
              let titleEquipment = titleEquipmentModel["title_equipment"] as? [[String: Any]] else {
            return nil
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: titleEquipment, options: [])
            let titles = try JSONDecoder().decode([TitleData].self, from: jsonData)
            return titles
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    private init() {}
}
