//
//  BasicModel.swift
//  ToyProject
//
//  Created by 박정우 on 3/3/24.
//

import Foundation

class BasicModel {
    static let shared = BasicModel()
    
    var basicDict: [String: Any]?
    
    private init () {}

    var characterGender: String? {
        guard let basicModel = basicDict,
              let gender = basicModel["character_gender"] as? String else {
            return nil
        }
        return gender
    }
    
    var createDay: String? {
        guard let basicModel = basicDict,
              let createDate = basicModel["character_date_create"] as? String else {
            return nil
        }
        return createDate
    }
    
    var characterName: String? {
        guard let basicModel = basicDict,
              let characterName = basicModel["character_name"] as? String else {
            return nil
        }
        return characterName
    }
    
    var formarJob: String? {
        guard let basicModel = basicDict,
              let formarJob = basicModel["character_class_name"] as? String else {
            return nil
        }
        return formarJob
    }
    
    var lastLogout: String? {
        guard let basicModel = basicDict,
              let lastLogout = basicModel["character_date_last_logout"] as? String else {
            
            return nil
        }
        
        
        return lastLogout
    }
    
    var lastlogin: String? {
        
        
        guard let basicModel = basicDict,
              let lastlogin = basicModel["character_date_last_login"] as? String else {
            return nil
        }
        return lastlogin
    }
    
    var characterExp: Int? {
        guard let basicModel = basicDict,
              let characterExp = basicModel["character_exp"] as? Int else {
            return nil
        }
        return characterExp
    }
    
    var characterLevel: Int? {
        guard let basicModel = basicDict,
              let characterLevel = basicModel["character_level"] as? Int else {
            return nil
        }
        return characterLevel
    }
    
}
