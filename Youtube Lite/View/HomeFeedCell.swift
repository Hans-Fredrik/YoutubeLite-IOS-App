//
//  HomeFeedCell.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/22/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import Foundation

class HomeFeedCell: FeedCell {

    var demoVideos: [Video] = {
        var taylorChannel = Channel()
        taylorChannel.name = "Taylor Swift EVO"
        taylorChannel.profileImageName = "profile_picture"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.imageName = "cover_picture"
        blankSpaceVideo.channel = taylorChannel
        blankSpaceVideo.numberOfViews = 2034619822
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood Featuring Kendrick Lamar"
        badBloodVideo.imageName = "cover_badblood"
        badBloodVideo.channel = taylorChannel
        badBloodVideo.numberOfViews = 1054880451
        
        var blankSpaceVideo2 = Video()
        blankSpaceVideo2.title = "Taylor Swift - Blank Space"
        blankSpaceVideo2.imageName = "cover_picture"
        blankSpaceVideo2.channel = taylorChannel
        blankSpaceVideo2.numberOfViews = 2034619822
        
        
        return [blankSpaceVideo, badBloodVideo, blankSpaceVideo2]
    }()
    
    override func fetchVideos() {
        VideoService.fetch(endPoint: .allVideos, {error, videos in
            
            if let actualVideos = videos {
                self.videos = actualVideos
                self.collectionView.reloadData()
            }else {
                print("\(String(describing: error))")
            }
            
        })
    }
    
}
