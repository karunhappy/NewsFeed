//
//  WebviewVC.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 06/01/22.
//

import UIKit
import WebKit

class WebviewVC: UIViewController {
    //: - IBoutlet
    @IBOutlet weak var webview: WKWebView!
    //: - Properties
    var webURL: String?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = webURL, !url.isEmpty {
            webview.load(URLRequest(url: URL(string: url)!))
        }
    }
    // Button Close action
    @IBAction func buttonCloseAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
