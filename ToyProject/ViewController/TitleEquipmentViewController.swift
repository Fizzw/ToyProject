//
//  TitleEquipmentViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/11/24.
//

import Foundation
import UIKit

class TitleEquipmentViewController: UIViewController {
    @IBOutlet weak var titleEquipmentViewControllerTableViewHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentViewLayer(layer: contentView
            .layer)
        
        tableView.dataSource = self
        tableView.delegate = self
        setUpHeaderLabel(headerLabel: titleEquipmentViewControllerTableViewHeader,setLabeltext: "장착 중인 타이틀")
    }
}

extension TitleEquipmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TitleEquipmentModel.shared.titleEquipmentArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleEquipmentCell_ID", for: indexPath) as? TitleEquipmentCell else {
            fatalError("Title cell Error")
        }
        cell.setUpLabel(forIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index path = \(indexPath)")
    }
}
