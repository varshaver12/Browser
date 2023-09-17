//
//  ViewController.swift
//  Browser
//
//  Created by 1234 on 17.09.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homePage = "https://apple.com"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        urlTextField.text = homePage
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func returnPressed(_ sender: UIButton) {
    }
    @IBAction func backReturn(_ sender: UIButton) {
    }
    
}

