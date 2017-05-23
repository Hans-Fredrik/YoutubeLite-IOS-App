//
//  VideoPlayer.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/23/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit

class VideoPlayer: NSObject {
    
    var video: Video
    
    init(video: Video) {
        self.video = video
    }
    
    func showVideoPlayer() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let detailedVideoView = UIView(frame: keyWindow.frame)
            
            detailedVideoView.backgroundColor = UIColor.white
            
            detailedVideoView.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            // 16 * 9 is the aspect ratio for all HD videos
            let height = keyWindow.frame.width * 9 / 16
            
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            let videoPlayerFrame = CGRect(x: 0, y: statusBarHeight, width: keyWindow.frame.width, height: height)
            
            let videoPlayerView = YoutubeVideoPlayer(frame: videoPlayerFrame, videoId: video.videoId!)
            
            detailedVideoView.addSubview(videoPlayerView)
            
            keyWindow.addSubview(detailedVideoView)
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                detailedVideoView.frame = keyWindow.frame
                
            }, completion: { _ in
                
            })
        }
        
    }
    
}
