//
//  TitleOwnViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/17/24.
//

import Foundation
import UIKit

class TitleOwnViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleOwnViewControllerTableViewHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentViewLayer(layer: contentView.layer)
        tableView.delegate = self
        tableView.dataSource = self
        setUpHeaderLabel(headerLabel: titleOwnViewControllerTableViewHeader, setLabeltext: "보유 중인 타이틀")
    }
}

extension TitleOwnViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleOwnModel.shared.titleOwns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleOwnCell_ID", for: indexPath) as? TitleOwnCell else {
            fatalError("titleOwn cell error")
        }
        
        let titleOwn = TitleOwnModel.shared.titleOwns[indexPath.row]
        cell.configure(withTitleOwn: titleOwn)
        return cell
    }
    
    
}
