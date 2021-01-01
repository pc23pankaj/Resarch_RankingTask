//
//  FirstVC.swift
//  ReseachRankingTask
//
//  Created by Pankaj Chauhan on 30/12/20.
//  Copyright © 2020 Pankaj Chauhan. All rights reserved.
//

import UIKit

class FirstVC: UIViewController,UITextFieldDelegate {
   
    
    
    // OUTLETS
    @IBOutlet weak var tblViewLearnRNR:UITableView!
    @IBOutlet weak var viewSearch:UIView!
    @IBOutlet weak var txtfldSearch:UITextField!
    @IBOutlet weak var imgViewSearchIcon:UIImageView!
    
    
    // CUSTOM NAVIGATION OUTLETS
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var lblNavTitle: UILabel!
    @IBOutlet weak var lblNavSubTitle: UILabel!
    
    
    // PROPERTIES
    var marrRNRType:NSMutableArray? = []
    
    
    //MARK: LIFE CYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewLearnRNR.register(UINib(nibName: "LearnRNRCell", bundle: nil), forCellReuseIdentifier: "LearnRNRCell")
        self.navigationController?.navigationBar.isHidden = true
        designUI()
        self.tblViewLearnRNR.reloadData()
        self.lblNavTitle.text = "Learn with RNR"
        self.lblNavSubTitle.text = "Learn the basis of investment & how to start with your first investment."
    }

    
// MARK:- DESIGN UI
    func designUI() {
        // ADDING INTO ARRAY
        var dict1: [AnyHashable : Any] = [:]
        dict1["title"] = "Why Invest?"
        dict1["sub_title"] = "Why you should invest in stock market?"
        dict1["avatar"] = "invest"
        var dict2: [AnyHashable : Any] = [:]
        dict2["title"] = "Basics of stock market."
        dict2["sub_title"] = "What you should know before investing?"
        dict2["avatar"] = "stock_Market"
        var dict3: [AnyHashable : Any] = [:]
        dict3["title"] = "Finding great companies."
        dict3["sub_title"] = "Where you should invest?"
        dict3["avatar"] = "companies"
        var dict4: [AnyHashable : Any] = [:]
        dict4["title"] = "Your investing life."
        dict4["sub_title"] = "Everyting you should know about investing."
        dict4["avatar"] = "investing_Life"
        var dict5: [AnyHashable : Any] = [:]
        dict5["title"] = "Getting started."
        dict5["sub_title"] = "How you should start investing"
        dict5["avatar"] = "getting_Start"
        
        self.marrRNRType?.add(dict1)
        self.marrRNRType?.add(dict2)
        self.marrRNRType?.add(dict3)
        self.marrRNRType?.add(dict4)
        self.marrRNRType?.add(dict5)
        
    }

   
    @IBAction func btnBackClicked(_ sender: Any) {
    }
    
}

extension FirstVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LearnRNRCell", for: indexPath) as? LearnRNRCell else { return UITableViewCell() }
        
            let dict = self.marrRNRType?[indexPath.row] as? NSDictionary
            cell.lblTitle.text = dict?["title"] as? String
            cell.lblTitle.sizeToFit()
            cell.lblSubTitle.text = dict?["sub_title"] as? String
            cell.lblSubTitle.sizeToFit()
            cell.imgViewAvatar.image = UIImage.init(named: dict?["avatar"] as! String)
            return cell
       }
    
}

extension FirstVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = self.marrRNRType?[indexPath.row] as? NSDictionary
        let strTitle = dict?["title"] as? String
        let strSubTitle = dict?["sub_title"] as? String
        // SENDING TITLE AND SUBTITLE AND MAKING IT DYNAMIC ON CLICKS
        let objVC = InvestViewController.shareInstance()
        objVC.strNavTitle = strTitle
        objVC.strNavSubTitle = strSubTitle
        
        self.navigationController?.pushViewController(objVC, animated: true)
        
       }
    
}

