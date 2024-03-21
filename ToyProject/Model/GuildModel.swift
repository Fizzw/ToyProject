//
//  GuildModel.swift
//  ToyProject
//
//  Created by 박정우 on 3/10/24.
//

import Foundation

class GuildModel {
    static let shared = GuildModel()
    
    var guildDict: [String: Any]?
    
    private init() {}
    
    var guildName: String? {
        guard let guildModel = guildDict,
              let guildName = guildModel["guild_name"] as? String else {
            return nil
        }
        return guildName
    }
    
}
