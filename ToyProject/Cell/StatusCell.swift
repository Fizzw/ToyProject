//
//  StatusCell.swift
//  ToyProject
//
//  Created by 박정우 on 3/13/24.
//

import Foundation
import UIKit

class StatusCell: UITableViewCell {
    
    @IBOutlet weak var statusIdLabel: UILabel!
    
    @IBOutlet weak var statusValueLabel: UILabel!
    func configure(withStat stat: Stat) {
        //TODO: value들 확인 stat 설명 넣을 예정
        let koreanTranslations: [String: String] = [
                   "ATK": "공격력",
                   "MATK": "마법 공격력",
                   "DEF": "방어력",
                   "STR": "힘",
                   "DEX": "민첩",
                   "INT": "지능",
                   "WILL": "의지",
                   "LUCK": "행운",
                   "HP": "최대 생명력",
                   "STAMINA": "최대 스태미나",
                   "HEAVY_LOAD": "미정",
                   "MEDIUM_LOAD": "미정",
                   "ATK_Speed": "공격 속도",
                   "ATK_Absolute": "공격력 제한 해제",
                   "Critical": "크리티컬",
                   "CritFactor": "크리트컬 피해량",
                   "Res_Critical": "크리티컬 저항",
                   "Balance": "밸런스",
                   "TOWN_SPEED": "대항력",
                   "SKILL_RANK_SUM": "스킬 랭크 합계",
                   // Add more translations as needed
               ]
        let koreanStatId = koreanTranslations[stat.statId] ?? stat.statId
                
                statusIdLabel.text = "\(koreanStatId): "
           statusValueLabel.text = "\(stat.statValue)"
       }
}
