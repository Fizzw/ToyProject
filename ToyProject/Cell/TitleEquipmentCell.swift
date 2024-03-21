//
//  TitleEquipmentCell.swift
//  ToyProject
//
//  Created by 박정우 on 3/11/24.
//

import Foundation
import UIKit

class TitleEquipmentCell: UITableViewCell {

    @IBOutlet weak var titleTypeLabel: UILabel!
    @IBOutlet weak var titleNameLable: UILabel!
    @IBOutlet weak var titleTypeNameLabel: UILabel!

    func setUpLabel(forIndex index: Int) {
        guard let titleDataArray = TitleEquipmentModel.shared.titleEquipmentArray else {
            print("Failed to get title data array.")
            return
        }
        
        // 인덱스가 유효한지 확인
        guard index >= 0 && index < titleDataArray.count else {
            print("Invalid index.")
            return
        }
        
        let titleData = titleDataArray[index]
        
        // 각 라벨에 해당하는 데이터 설정
        titleTypeNameLabel.text = titleData.titleEquipmentTypeName
        titleNameLable.text = titleData.titleName
        titleTypeLabel.text = titleData.titleType
    }

}
