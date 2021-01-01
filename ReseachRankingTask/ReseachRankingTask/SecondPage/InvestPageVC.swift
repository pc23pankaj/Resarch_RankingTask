//
//  InvestPageVC.swift
//  ReseachRankingTask
//
//  Created by Pankaj Chauhan on 31/12/20.
//  Copyright © 2020 Pankaj Chauhan. All rights reserved.
//

import Foundation
import UIKit

class InvestPageVC: UIPageViewController {
    
    fileprivate var items: [UIViewController] = []
    var marrInvest:NSMutableArray? = []
    var nowPage = 0
    
      override func viewDidLoad() {
          super.viewDidLoad()
          dataSource = self
        
          populateItems()
          if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
          }
        
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [InvestPageVC.self])
        
        appearance.pageIndicatorTintColor = UIColor.init(hexString:"#01AA01").withAlphaComponent(0.2)
        appearance.currentPageIndicatorTintColor = UIColor.init(hexString:"#01AA01").withAlphaComponent(0.8)
        // 01AA01
        
      }
      
    
    
      fileprivate func decoratePageControl() {
          let pc = UIPageControl.appearance(whenContainedInInstancesOf: [InvestPageVC.self])
          pc.currentPageIndicatorTintColor = .orange
          pc.pageIndicatorTintColor = .gray
      }
    
    fileprivate func populateItems() {
      
        var dict1: [AnyHashable : Any] = [:]
        dict1["header"] = "Why Buy Stocks?"
        dict1["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict1["avatar"] = "card1"
        
        var dict2: [AnyHashable : Any] = [:]
        dict2["header"] = "Basics of stock market."
        dict2["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict2["avatar"] = "card2"
        var dict3: [AnyHashable : Any] = [:]
        dict3["header"] = "Finding great invesments."
        dict3["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict3["avatar"] = "card3"
        var dict4: [AnyHashable : Any] = [:]
        dict4["header"] = "Your investing life."
        dict4["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict4["avatar"] = "card4"
        var dict5: [AnyHashable : Any] = [:]
        dict5["header"] = "Maintaining Stocks."
        dict5["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict5["avatar"] = "card5"
        var dict6: [AnyHashable : Any] = [:]
        dict6["header"] = "Getting started."
        dict6["content"] = "Owning stock means owning a piece of a company.\nInvested Funds are working for you 24/7.\nInvested money can grow much faster than cash in a saving account."
        dict6["avatar"] = "card6"
         
        self.marrInvest?.add(dict1)
        self.marrInvest?.add(dict2)
        self.marrInvest?.add(dict3)
        self.marrInvest?.add(dict4)
        self.marrInvest?.add(dict5)
        self.marrInvest?.add(dict6)
        
        
        for (i) in 0..<(self.marrInvest?.count ?? 0) {
            let dict = self.marrInvest?[i] as? NSDictionary
            let strHeader = dict?["header"] as? String
            let strContent = dict?["content"] as? String
            let strAvatar = dict?["avatar"] as? String
            let c = createPageItemControler(chapter: "Chapter \(i+1)/\(self.marrInvest?.count ?? 1)", header: strHeader, content: strContent, image: strAvatar)
            items.append(c)
        }
        
    }
    
    
    fileprivate func createPageItemControler(chapter strChapter: String?,header strHeader: String?, content strContent: String?,image strImageText: String?) -> UIViewController {
        let page = UIViewController()
        page.view = PageItem(strChapter: strChapter, strHeader: strHeader, strContent: strContent, strImageText: strImageText)

        return page
    }
    
}


// MARK: - DataSource

extension InvestPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        nowPage = items.firstIndex(of: viewController) ?? 0
        
        if nowPage - 1 < 0 {
            return nil
        }
//              return controllers[nowPage - 1]
//
//        guard items.count > previousIndex else {
//            return nil
//        }
//
        return items[nowPage-1]
        

        
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
//            return nil
//        }
//
//        let nextIndex = viewControllerIndex + 1
////        guard items.count != nextIndex else {
////            return items.first
////        }
//
//        guard items.count > nextIndex else {
//            return nil
//        }
//
//        return items[nextIndex]
//
        
        nowPage = items.firstIndex(of: viewController) ?? items.count - 1
        if nowPage + 1 >= items.count {
            return nil
        }
        return items[nowPage + 1]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return items.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return nowPage//firstViewControllerIndex
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
