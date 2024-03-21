//
//  ProfileViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/1/24.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    let imageArray = [
                        "profileIcon-removebg-preview",
                        "titleIcon-removebg-preview",
                        "guildIcon-removebg-preview",
                        "weaponIcon-removebg-preview",
                        "shapeIcon-removebg-preview",
                        "statusIcon-removebg-preview"
                     ]
    let imageNameArray = [
                        "기본정보 조회",
                        "타이틀 조회",
                        "길드 조회",
                        "아이템 조회",
                        "보유문양 조회",
                        "능력치 조회",
                        ]
    let networkManager = NetworkManager()
    //MARK: IBOutlet
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var activityIndicatior: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: IBAction
    @IBAction func characterNameSearchButton(_ sender: Any) {
        //TODO: 리팩토링 해야 함 함수화
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicatior.isHidden = true
            self.activityIndicatior.stopAnimating()
        }
        activityIndicatior.isHidden = false
        activityIndicatior.startAnimating()
        textField.resignFirstResponder() // 텍스트 필드로부터 포커스 제거
        if OcidModel.shared.ocid != nil {
            if textField.text == "" { //textField text는 공백이거나 있거나 nil일 수는 없음
                showToast(message: "닉네임을 제대로 입력해주세요.")
            } else {
                networkManager.getCharacterOcid(textField.text!) { isSuccess in
                    DispatchQueue.main.async {
                        if isSuccess == true {
                            print(OcidModel.shared.ocid!)
                            self.showToast(message: "\(String(describing: self.textField.text!)) (으)로 다시 검색합니다:)")
                        } else {
                            self.showToast(message: "존재하지 않는 닉네임입니다.")
                        }
                    }
                    
                }
            }
        } else {
            if textField.text == "" { //textField text는 공백이거나 있거나 nil일 수는 없음
                showToast(message: "닉네임을 제대로 입력해주세요.")
            } else {
                networkManager.getCharacterOcid(textField.text!) { isSuccess in
                    DispatchQueue.main.async {
                        if isSuccess == true {
                            print(OcidModel.shared.ocid!)
                            self.showToast(message: "\(String(describing: self.textField.text!)) (으)로 검색합니다:)")
                            
                        } else {
                            self.showToast(message: "존재하지 않는 닉네임입니다.")
                        }
                    }
                }
            }
        }
 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatior.isHidden = true
        textField.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() // 텍스트 필드로부터 포커스 제거
           return true
       }
    
    
    func alert() {
        let alertController = UIAlertController(title: "알림", message: "존", preferredStyle: .alert)
                
                // 알림에 추가할 액션 생성
            let okAction = UIAlertAction(title: "확인", style: .default) { (action:UIAlertAction!) in
                // 확인 버튼이 눌렸을 때 실행할 동작
                print("확인 버튼이 눌렸습니다.")
            }
            
            // 알림에 추가할 액션 추가
            alertController.addAction(okAction)
            
            // 알림 표시
            self.present(alertController, animated: true, completion: nil)
        }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: CollectionViewControllerCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewControllerCell
        
        cell.contentView.backgroundColor = .gray
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = CGColor(gray: 5.0, alpha: 1.0)
        
        cell.imageView.image = UIImage(named: self.imageArray[indexPath.item])
        cell.explanLabel.text = self.imageNameArray[indexPath.item]
        
        collectionView.collectionViewLayout = setCompositionLayout()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = imageArray[indexPath.item]
        if OcidModel.shared.ocid != nil {
            switch selectedItem {
            case "profileIcon-removebg-preview":
                if let basicInfoViewController = storyboard?.instantiateViewController(withIdentifier: "BasicInfoViewControllerIdentifier") as? BasicInfoViewController {
                    basicInfoViewController.modalPresentationStyle = .automatic
                    present(basicInfoViewController, animated: true, completion: nil)
                }
                
            case "guildIcon-removebg-preview":
                if let guildInfoViewController = storyboard?.instantiateViewController(withIdentifier: "GuildInfoViewControllerIdentifier") as? GuildInfoViewController {
                    guildInfoViewController.modalPresentationStyle = .automatic
                    present(guildInfoViewController, animated: true, completion: nil)
                }
            case "titleIcon-removebg-preview":
                if let titleEqupmentViewController = storyboard?.instantiateViewController(withIdentifier: "TitleEquipmentViewControllerIdentifier") as? TitleEquipmentViewController {
                    titleEqupmentViewController.modalPresentationStyle = .automatic
                    present(titleEqupmentViewController, animated: true, completion: nil)
                }
            case "statusIcon-removebg-preview":
                if let statusViewController = storyboard?.instantiateViewController(withIdentifier: "StatusViewControllerIdentifier") as? StatusViewController {
                    statusViewController.modalPresentationStyle = .automatic
                    present(statusViewController, animated: true, completion: nil)
                }
         
            case "shapeIcon-removebg-preview":
                if let titleOwnViewController = storyboard?.instantiateViewController(withIdentifier: "TitleViewControllerIdentifier") as? TitleOwnViewController {
                    titleOwnViewController.modalPresentationStyle = .automatic
                    present(titleOwnViewController, animated: true, completion: nil)
                }
                
            default:
                break
            }
        } else {
            showToast(message: "닉네임을 제대로 입력해주세요.")
        }
    }
}

extension ProfileViewController {
    fileprivate func setCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{
            
            (sectionIndex: Int, layoutEnverionment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(0.5))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        
        
        return layout
    }
}
extension ProfileViewController: UICollectionViewDelegate {
    
}
