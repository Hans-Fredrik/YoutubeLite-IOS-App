//
//  HomeFeedCell.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/22/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

class HomeFeedCell: FeedCell {
    
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
