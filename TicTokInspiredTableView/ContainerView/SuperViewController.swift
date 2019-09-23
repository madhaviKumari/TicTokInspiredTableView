//
//  SuperViewController.swift
//  TicTokInspiredTableView
//
//  Created by Afsar Sir on 21/09/19.
//  Copyright © 2019 Afsar Sir. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    
    lazy var tableView: TTableViewTableViewController = {
        
        let storyBord = UIStoryboard(name: "Main", bundle: nil)
        
        let tViewController = storyBord.instantiateViewController(withIdentifier: "TTableViewTableViewController") as! TTableViewTableViewController
        
        return tViewController
        
        
    }()
    
    lazy var holdView: HoldViewController = {
        
        let storyBord = UIStoryboard(name: "Main", bundle: nil)
        
        let tViewController = storyBord.instantiateViewController(withIdentifier: "HoldViewController") as! HoldViewController
        return tViewController
        
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    func setup(){
        
        setupSegmenter()
    }
    
    
    func setupSegmenter(){
        segmented.removeBorders()
       // segmented.insertSegment(withTitle: "For you", at: 0, animated: true)
        //segmented.insertSegment(withTitle: "Following", at: 1, animated: true)
        segmented.addTarget(self, action: #selector(segementerDidChange(_sender:)), for: .valueChanged)
        loadChild(childViewController: tableView)
        loadChild(childViewController: holdView)
        segmented.selectedSegmentIndex = 0
    }

    
    
    
    @objc func segementerDidChange(_sender: UISegmentedControl){
        
        print("Tapped at \(_sender.selectedSegmentIndex)")
        updateView()
    
    }
  
    
    func updateView(){
        
        tableView.view.isHidden = !(segmented.selectedSegmentIndex == 1)
        holdView.view.isHidden = (segmented.selectedSegmentIndex == 1)
        
        
    }
    
    func loadChild(childViewController: UIViewController){
        
        mView.addSubview(childViewController.view)
        childViewController.view.frame = mView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       // childViewController.didMove(toParent: self)
        
    }
    
    func removeChild(childViewController: UIViewController){
        
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
        
        
    }
    
    
    
    
    
    
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? UIColor.clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor(red: 255, green: 109, blue: 1, alpha: 0.1)), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.white), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 30.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
