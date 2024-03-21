//
//  BundleExtension.swift
//  ToyProject
//
//  Created by 박정우 on 3/2/24.
//

import Foundation

extension Bundle {
    var apiKey: String? {
           guard let file = self.path(forResource: "SecureApiKey", ofType: "plist"),
                 let resource = NSDictionary(contentsOfFile: file),
                 let key = resource["API_KEY"] as? String else {
               print("API KEY를 가져오는데 실패하였습니다.")
               return nil
           }
           return key
       }
}
