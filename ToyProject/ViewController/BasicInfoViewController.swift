//
//  BasicInfoViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/10/24.
//

import Foundation
import UIKit
class BasicInfoViewController: UIViewController {
  
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var createDayLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var formerJobLabel: UILabel!
    @IBOutlet weak var characterLevelLabel: UILabel!
    @IBOutlet weak var getExpLabel: UILabel!
    @IBOutlet weak var lastLoginLabel: UILabel!
    @IBOutlet weak var lastLogoutLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentViewLayer(layer: contentView.layer)
        
        if let gender = BasicModel.shared.characterGender {
            if gender == "F" {
                genderLabel.text = "여성"
            } else if gender == "M" {
                genderLabel.text = "남성"
            }
            
        }
        
        if let characterexp = BasicModel.shared.characterExp {
            getExpLabel.text = String(describing: characterexp)
        }
        
        if let characterLevel = BasicModel.shared.characterLevel {
            characterLevelLabel.text = String(describing: characterLevel)
        }
        
        if let characterName = BasicModel.shared.characterName {
            characterNameLabel.text = characterName
        }
        
        if let lastLogin = BasicModel.shared.lastlogin {
            lastLoginLabel.text = convertDateFormat(dateString: lastLogin, inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        }
        
        if let lastLogout = BasicModel.shared.lastLogout {
            if let lastLogin = BasicModel.shared.lastlogin {
                if lastLogin > lastLogout {
                    lastLogoutLabel.text = "로그인 상태"
                } else {
                    lastLogoutLabel.text = convertDateFormat(dateString: lastLogout, inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                }
            }
          
        }
        
        if let createDay = BasicModel.shared.createDay {
            createDayLabel.text = convertDateFormat(dateString: createDay, inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        }
        
        if let formarJob = BasicModel.shared.formarJob {
            formerJobLabel.text = formarJob
        }
    }
}
