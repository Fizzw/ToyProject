//
//  TitleOwnCell.swift
//  ToyProject
//
//  Created by 박정우 on 3/17/24.
//

import Foundation
import UIKit

class TitleOwnCell: UITableViewCell {
    
    @IBOutlet weak var titleNameLabel: UILabel!
    
    @IBOutlet weak var titleTypeLabel: UILabel!
    func configure(withTitleOwn titleOwn: TitleOwn) {
        let koreanTranslations: [String: String] = [
                    "title": "타이틀",
                   // Add more translations as needed
               ]
        let koreanTitleOwnType = koreanTranslations[titleOwn.titleType] ?? titleOwn.titleType
        
        titleNameLabel.text = "\(titleOwn.titleName)"
        titleTypeLabel.text = "\(koreanTitleOwnType)"
       }
}
