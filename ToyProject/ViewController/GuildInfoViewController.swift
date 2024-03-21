//
//  GuildInfoViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/10/24.
//

import Foundation
import UIKit

class GuildInfoViewController: UIViewController {
    
    @IBOutlet weak var guildNameLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContentViewLayer(layer: contentView.layer)
        if let guildName = GuildModel.shared.guildName {
            guildNameLabel.text = guildName
        } else {
            guildNameLabel.text = "가입된 길드가 없습니다."
        }
        
    }
}
