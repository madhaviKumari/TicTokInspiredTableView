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
