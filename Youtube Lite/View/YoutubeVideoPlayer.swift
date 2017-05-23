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
    
    init(frame: CGRect, videoId: String) {
        super.init(frame: frame)
        
        allowsInlineMediaPlayback = true
        mediaPlaybackRequiresUserAction = false
        scrollView.isScrollEnabled = false
        
        let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='https://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='\(frame.size.width)' height='\(frame.size.height)' src='https://www.youtube.com/embed/\(videoId)?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'></body></html>"
        
        loadHTMLString(embededHTML, baseURL: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
