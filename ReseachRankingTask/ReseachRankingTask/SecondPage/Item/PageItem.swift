//
//  PageItem.swift
//  ReseachRankingTask
//
//  Created by Pankaj Chauhan on 31/12/20.
//  Copyright © 2020 Pankaj Chauhan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PageItem: UIView {

    static let ITEM_NIB = "PageItem"
    
    @IBOutlet var vwContent: UIView!
    @IBOutlet var vwBackground: UIView!
    @IBOutlet var lblChapter: UILabel!
    @IBOutlet var lblInvestHeader: UILabel!
    
    @IBOutlet weak var imgViewInvest: UIImageView!
    @IBOutlet weak var txtViewInvestContent: UITextView!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    
    convenience init(strChapter: String? = "", strHeader:String? = "", strContent:String? = "", strImageText:String? = "") {
        self.init()
        lblChapter.text = strChapter
        lblInvestHeader.text = strHeader
        
        txtViewInvestContent.text = strContent
        imgViewInvest.image = UIImage.init(named: strImageText ?? "")
        
        self.vwContent.layer.cornerRadius = 20

        self.vwContent.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.vwContent.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.vwContent.layer.shadowOpacity = 1.0
        self.vwContent.layer.shadowRadius = 3.0
      
        self.vwContent.layer.masksToBounds = false
    }
    
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(PageItem.ITEM_NIB, owner: self, options: nil)
        vwBackground.frame = bounds
        vwBackground.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(vwBackground)
    }
    
    
}
