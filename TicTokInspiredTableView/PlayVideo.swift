//
//  PlayVideo.swift
//  TicTokInspiredTableView
//
//  Created by Afsar Sir on 21/09/19.
//  Copyright © 2019 Afsar Sir. All rights reserved.
//

import Foundation
import UIKit
import AVKit;
import AVFoundation;


class PlayVideo: UIView {
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self;
    }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer;
    }
    var player: AVPlayer? {
        get {
            return playerLayer.player;
        }
        set {
            playerLayer.player = newValue;
        }
    }
}
