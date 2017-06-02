//
//  YoutubeVideoPlayer.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/23/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit
import AVFoundation

class YoutubeVideoPlayer: UIWebView {
    
    var originalLocation = CGPoint(x: 0, y: 0)
    var videoPlayer: VideoPlayer
    
    init(frame: CGRect, videoId: String, videoPlayer: VideoPlayer) {
        self.videoPlayer = videoPlayer
        super.init(frame: frame)
        
        originalLocation = self.center
        allowsInlineMediaPlayback = true
        mediaPlaybackRequiresUserAction = false
        scrollView.isScrollEnabled = false
        
        let embeddedHtml = generateYoutubeHtmlLink(width: frame.size.width, height: frame.size.height, videoId: videoId)
        loadHTMLString(embeddedHtml, baseURL: nil)
        
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(self.detectPan(_:)))
        
        self.gestureRecognizers = [panRecognizer]
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func detectPan(_ recognizer: UIPanGestureRecognizer) {
        let translation  = recognizer.translation(in: self.superview)
    
        switch recognizer.state {
        case .changed:
            checkImageBoundry(insideLimit: {
                self.center = CGPoint(x: originalLocation.x, y: originalLocation.y + translation.y)
            }, outsideLimit: {
                self.videoPlayer.hideVideoPlayer()
            }, translationY: translation.y)
            
        case .ended:
            checkImageBoundry(insideLimit: {
                self.center = CGPoint(x: originalLocation.x, y: originalLocation.y)
            }, outsideLimit: nil, translationY: translation.y)
            
        default: ()
        }
    }
    
    
    func checkImageBoundry(insideLimit: (Void) -> Void, outsideLimit: ((Void) -> Void?)?, translationY: CGFloat) {
        if translationY < 90 {
            insideLimit()
        }else {
            outsideLimit?()
        }
        
    }
    
    
    func generateYoutubeHtmlLink(width: CGFloat, height: CGFloat, videoId: String) -> String {
         let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='https://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='\(width)' height='\(height)' src='https://www.youtube.com/embed/\(videoId)?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'></body></html>"
        
        return embededHTML
    }
    
}
