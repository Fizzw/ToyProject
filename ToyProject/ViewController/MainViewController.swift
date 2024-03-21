//
//  MainViewController.swift
//  ToyProject
//
//  Created by 박정우 on 3/1/24.
//

import Foundation
import UIKit
import WebKit

class MainViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView.navigationDelegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://heroes.nexon.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}

