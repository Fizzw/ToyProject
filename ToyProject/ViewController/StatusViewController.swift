//
//  StatusViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/13/24.
//

import Foundation
import UIKit

class StatusViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var statusViewControllerTableViewHeader: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentViewLayer(layer: contentView.layer)
        tableView.delegate = self
        tableView.dataSource = self
        setUpHeaderLabel(headerLabel: statusViewControllerTableViewHeader,setLabeltext: "능력치")
    }
    
}

extension StatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StatusModel.shared.stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell_ID", for: indexPath) as? StatusCell else {
            fatalError("status cell error")
        }
    
        let stat = StatusModel.shared.stats[indexPath.row]
           cell.configure(withStat: stat)
           return cell
       }
    
    
}
    
    

