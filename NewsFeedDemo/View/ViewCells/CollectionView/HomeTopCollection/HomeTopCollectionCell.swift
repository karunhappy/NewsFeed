//
//  HomeTopCollectionCell.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 01/01/22.
//

import UIKit

class HomeTopCollectionCell: UICollectionViewCell {
    //: - IBoutlet
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBorder: UIView!
    
    //: - Properties
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var title: String? {
        didSet {
            self.labelTitle.text = title
        }
    }
    
    var showBorder: Bool? {
        didSet {
            viewBorder.isHidden = showBorder ?? false
        }
    }
}
