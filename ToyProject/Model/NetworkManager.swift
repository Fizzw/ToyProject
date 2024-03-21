//
//  NetworkManager.swift
//  ToyProject
//
//  Created by 박정우 on 3/2/24.
//

import Foundation

class NetworkManager {
    let apiKey: String = Bundle.main.apiKey!
    let apiUrlForm = APIUrlForm()
    
    func getCharacterOcid(_ name: String, completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterOcid + name)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(false)
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            if let ocid = json["ocid"] as? String {
                                OcidModel.shared.ocid = ocid
                                self.getCharacterBasic()
                                self.getCharacterGuild()
                                self.getCharacterItem()
                                self.getCharacterOwnTitle()
                                self.getCharacterStatus()
                                self.getCharacterEquipTitle()
                                completion(true)
                            } else {
                                completion(false)
                            }
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(false)
                    }
                }
            }
        }
        task.resume()
        
    }
    
    func getCharacterBasic() {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterBasic + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            BasicModel.shared.basicDict = json
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getCharacterGuild() {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterGuild + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            GuildModel.shared
                                .guildDict = json
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getCharacterItem() {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterItemEquipment + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            /*
                             json item is ["item_equipment": <__NSArrayI 0x600003318000>(
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = "Right Hand";
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Ub4c0\Uc5bc\Uc2a4\Ud53c\Uc5b4";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Head;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Uba38\Ub9ac \Ubcf4\Ud638\Uad6c";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Upper;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Uac00\Uc2b4 \Ubcf4\Ud638\Uad6c";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Lower;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Ub2e4\Ub9ac \Ubcf4\Ud638\Uad6c";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Hand;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Uc190 \Ubcf4\Ud638\Uad6c";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Leg;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8 9\Uae09 \Ubc1c \Ubcf4\Ud638\Uad6c";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = "Right Finger";
                                 "item_name" = "\Uc601\Ud63c\Uc758 \Uc778\Uc0ac";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = "Left Finger";
                                 "item_name" = "\Uc2ec\Ud574\Uc758 \Uc120\Uace0";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Earring;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8\Uc758 \Uadc0\Uac78\Uc774 (50\Ub808\Ubca8 \Uc774\Uc0c1)";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Belt;
                                 "item_name" = "\Uc6a9\Ubcd1\Ub2e8\Uc758 \Ubca8\Ud2b8 (50\Ub808\Ubca8 \Uc774\Uc0c1)";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = Charm;
                                 "item_name" = "\Ub2ec\Ube5b \Uc0ac\Ud30c\Uc774\Uc5b4 \Ube0c\Ub85c\Uce58";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = "Right Wrist";
                                 "item_name" = "\Ubbf8\Uc9c0\Uc758 \Uad6c\Ub9ac \Ud314\Ucc0c (\Uc99d\Uc815)";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = "Left Wrist";
                                 "item_name" = "\Ubbf8\Uc9c0\Uc758 \Uad6c\Ub9ac \Ud314\Ucc0c (\Uc99d\Uc815)";
                             },
                             {
                                 "item_equipment_page" = Cash;
                                 "item_equipment_slot_name" = "Inner Armor";
                                 "item_name" = "\Ub9ac\Uc2dc\Ud0c0 \Uc774\Ub108\Uc544\Uba38 \Ubd95\Ub300\Ud615";
                             },
                             {
                                 "item_equipment_page" = Cash;
                                 "item_equipment_slot_name" = "Avatar_Tunic";
                                 "item_name" = "\Uc0ac\Ub9bd \Ub85c\Uccb4\Uc2a4\Ud2b8 \Uc790\Ucf13 (\Uc774\Ubca4\Ud2b8)";
                             },
                             {
                                 "item_equipment_page" = Cash;
                                 "item_equipment_slot_name" = "Avatar_Pants";
                                 "item_name" = "\Uc0ac\Ub9bd \Ub85c\Uccb4\Uc2a4\Ud2b8 \Ud32c\Uce20 (\Uc774\Ubca4\Ud2b8)";
                             },
                             {
                                 "item_equipment_page" = Cash;
                                 "item_equipment_slot_name" = "Avatar_Boots";
                                 "item_name" = "\Uc0ac\Ub9bd \Ub85c\Uccb4\Uc2a4\Ud2b8 \Uc288\Uc988 (\Uc774\Ubca4\Ud2b8)";
                             },
                             {
                                 "item_equipment_page" = Bag;
                                 "item_equipment_slot_name" = SubWeapon;
                                 "item_name" = "\Ucc3d";
                             }
                             )
                             ]
                             */
                            print("json item is \(json)")
                            let unicodeString = "\\Uc0ac\\Ub9bd \\Ub85c\\Uccb4\\Uc2a4\\Ud2b8 \\Uc288\\Uc988 (\\Uc774\\Ubca4\\Ud2b8)"
                            if let data = unicodeString.data(using: .utf8),
                                let decodedString = String(data: data, encoding: .nonLossyASCII) {
                                print(decodedString) // Prints: "가븝 로코스틸 슈트 (이캄틸)"
                            } else {
                                print("Failed to decode the string.")
                            }
                            
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getCharacterOwnTitle() {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterTitle + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            print("json title is \(json)")
                            TitleOwnModel.shared.setTitleOwns(withData: json)
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }

    func getCharacterStatus() {
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterStatus + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            StatusModel.shared.setStats(withData: json)
                            
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getCharacterEquipTitle() {
        /*
         json titleEquip is ["title_equipment": <__NSSingleObjectArrayI 0x2806c2710>(
         {
             "title_equipment_type_name" = "\Uace0\Uc815";
             "title_name" = "\Uccab \Uac78\Uc74c\Ub9c8\Ub97c \Ub5c0";
             "title_type" = title;
         }
         */
        var request = URLRequest(url: URL(string: apiUrlForm.apiBaseUrl + apiUrlForm.characterTitleEquipment + OcidModel.shared.ocid!)!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-nxopen-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let jsonString = (String(data: data, encoding: .utf8)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    do {
                        // JSON 데이터를 파싱하여 딕셔너리로 변환
                        let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]

                        let titleEquipmentModel = TitleEquipmentModel.shared
                        
                        // 딕셔너리 설정
                        titleEquipmentModel.titleEquipmentDict = jsonDict
                        
                        // TitleData 배열 가져오기
                        if let titleDataArray = titleEquipmentModel.titleEquipmentArray {
                            for titleData in titleDataArray {
                                // 각 TitleData 항목에 대해 작업 수행
                                print("Title Equipment Type Name: \(titleData.titleEquipmentTypeName)")
                                print("Title Name: \(titleData.titleName)")
                                print("Title Type: \(titleData.titleType)")
                            }
                        } else {
                            print("Failed to get title data array.")
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                } else {
                    print("Failed to convert JSON string to data.")
                }
            }
        }
        task.resume()
    }
}
