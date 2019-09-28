//
//  TTableViewCell.swift
//  TicTokInspiredTableView
//
//  Created by Afsar Sir on 20/09/19.
//  Copyright © 2019 Afsar Sir. All rights reserved.
//

import UIKit
import AVFoundation

class TTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var circularImage: UIImageView!
   
    @IBOutlet weak var videov: PlayVideo!
    @IBOutlet weak var userDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circularImage.clipsToBounds = true
        circularImage.layer.cornerRadius = circularImage.frame.size.height/2
        circularImage.layer.borderWidth = 2
        circularImage.layer.backgroundColor =   UIColor.clear.cgColor
        circularImage.layer.borderColor = UIColor.gray.cgColor
        
        
       // iminButton.layer.cornerRadius = 10
        //iminButton.layer.backgroundColor = UIColor.orange.cgColor
        self.addGradientBackground(firstColor: .black, secondColor: .white)
    }
      
    
    
    
    

    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

       
    }

}

extension UIView{
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        print(gradientLayer.frame)
       // self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
