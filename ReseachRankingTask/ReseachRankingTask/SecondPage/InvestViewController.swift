//
//  InvestViewController.swift
//  ReseachRankingTask
//
//  Created by Pankaj Chauhan on 30/12/20.
//  Copyright © 2020 Pankaj Chauhan. All rights reserved.
//

import UIKit

class InvestViewController: UIViewController {

    @IBOutlet weak var viewPageVC: UIView!
    
    // CUSTOM NAVIGATION OUTLETS
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var lblNavTitle: UILabel!
    @IBOutlet weak var lblNavSubTitle: UILabel!
    
    var strNavTitle:String?
    var strNavSubTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.lblNavTitle.text = self.strNavTitle
        self.lblNavSubTitle.text = self.strNavSubTitle
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension InvestViewController {
    static func shareInstance() -> InvestViewController{
        InvestViewController.instantiateFromStoryboard()
    }
}
