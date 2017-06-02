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
    
    var keyWindow: UIView
    var detailedVideoView: UIView
    var youtubeVideoPlayer: YoutubeVideoPlayer?
    
    init(video: Video, keyWindow: UIView) {
        self.video = video
        self.keyWindow = keyWindow
        self.detailedVideoView = UIView(frame: keyWindow.frame)
    }
    
    
    func showVideoPlayer() {
            detailedVideoView.backgroundColor = UIColor.white
            detailedVideoView.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            // 16 * 9 is the aspect ratio for all HD videos
            let height = keyWindow.frame.width * 9 / 16
            
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            let videoPlayerFrame = CGRect(x: 0, y: statusBarHeight, width: keyWindow.frame.width, height: height)
            
            youtubeVideoPlayer = YoutubeVideoPlayer(frame: videoPlayerFrame, videoId: video.videoId!, videoPlayer: self)

            detailedVideoView.addSubview(youtubeVideoPlayer!)
            
            keyWindow.addSubview(detailedVideoView)
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.detailedVideoView.frame = self.keyWindow.frame
                
            }, completion: { _ in
                
            })
    }
    
    
    func hideVideoPlayer() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    
            self.detailedVideoView.frame = CGRect(x: self.keyWindow.frame.width, y: self.keyWindow.frame.height, width: 0, height: 0)
            
        }, completion: {_ in
            self.keyWindow.willRemoveSubview(self.detailedVideoView)
            
            if self.youtubeVideoPlayer != nil {
                self.youtubeVideoPlayer?.stopLoading()
                self.youtubeVideoPlayer?.loadRequest(URLRequest(url: URL(string: "about::blank")!))
                self.detailedVideoView.willRemoveSubview(self.youtubeVideoPlayer!)
                self.youtubeVideoPlayer?.gestureRecognizers = nil
                self.youtubeVideoPlayer = nil
            }
        })
    }
}
