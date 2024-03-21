//
//  APIConstants.swift
//  ToyProject
//
//  Created by 박정우 on 3/2/24.
//

import Foundation

struct APIUrlForm {
    let apiBaseUrl = "https://open.api.nexon.com"
    let characterOcid = "/heroes/v1/id?character_name="
    let characterBasic = "/heroes/v1/character/basic?ocid="
    let characterTitle = "/heroes/v1/character/title?ocid="
    let characterTitleEquipment = "/heroes/v1/character/title-equipment?ocid="
    let characterItemEquipment = "/heroes/v1/character/item-equipment?ocid="
    let characterStatus = "/heroes/v1/character/stat?ocid="
    let characterGuild = "/heroes/v1/character/guild?ocid="
}
