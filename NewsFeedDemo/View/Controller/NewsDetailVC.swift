//
//  NewsDetailVC.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 06/01/22.
//

import UIKit

class NewsDetailVC: UIViewController {
    //: - IBoutlet
    @IBOutlet weak var imageviewNews: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageviewAuthor: UIImageView!
    @IBOutlet weak var labelAuthorName: UILabel!
    
    //: - Properties
    var detailModel: NewsDetail?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setData()
    }
    
    // Button back action
    @IBAction func buttonBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Button View Full News action
    @IBAction func buttonFullNewsAction(_ sender: UIButton) {
        openWebview(url: detailModel?.url)
    }
    // Button Author action
    @IBAction func buttonAuthorAction(_ sender: UIControl) {
        openWebview(url: detailModel?.authors?.first?.bio)
    }
}
extension NewsDetailVC {
    /// Set news data
    func setData() {
        imageviewNews.load(from: detailModel?.headlineImageUrl ?? "")
        labelTitle.text = detailModel?.title
        labelDescription.text = detailModel?.description
        
        let author = detailModel?.authors?.first
        labelAuthorName.text = author?.name
        imageviewAuthor.load(from: author?.photo ?? "")
    }
    
    /// Open webview from url
    /// - Parameter url: Web url
    func openWebview(url: String?) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: WebviewVC.self)) as! WebviewVC
        vc.webURL = url
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
}
