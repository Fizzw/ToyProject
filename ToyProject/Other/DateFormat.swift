//
//  DateFormat.swift
//  ToyProject
//
//  Created by 박정우 on 3/10/24.
//

import Foundation
import UIKit

extension UIViewController {
    func convertDateFormat(dateString: String, inputFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        //dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Setting locale to avoid potential issues
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분" // Fixed output format
            dateFormatter.timeZone = TimeZone.current
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func setContentViewLayer(layer: CALayer) {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
    func setUpHeaderLabel(headerLabel: UILabel,setLabeltext: String) {
        if let characterName = BasicModel.shared.characterName {
            headerLabel.text = "\"\(characterName)\"님의 \(setLabeltext)"
        }
    }
}
