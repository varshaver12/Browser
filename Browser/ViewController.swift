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
        
        urlTextField.delegate = self
        webView.navigationDelegate = self
        
        let homePage = "https://apple.com"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        urlTextField.text = homePage
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func returnPressed(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func backReturn(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        textField.resignFirstResponder()
        return true
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTextField.text = webView.url?.absoluteString
        
        backButton.isEnabled = webView.canGoBack
        returnButton.isEnabled = webView.canGoForward
    }
}

