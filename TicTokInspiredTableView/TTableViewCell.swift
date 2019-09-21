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

    
    @IBOutlet weak var videov: PlayVideo!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
