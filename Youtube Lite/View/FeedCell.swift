//
//  FeedCell.swift
//  Youtube Lite
//
//  Created by Hans Fredrik Fuglerud Brastad on 5/15/17.
//  Copyright © 2017 Hans Fredrik Fuglerud Brastad. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
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
        
        
        return [blankSpaceVideo, badBloodVideo,blankSpaceVideo2]
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let layoyt = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layoyt)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let cellId = "cellId"
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the correct aspect ratio based on screen width
        let height = (frame.width - 16 - 16) * 9 / 16
        
        // Adding 16 back because of margin and 68 for rest of the elements in the cell (profile pic, title and subtitle)
        return CGSize(width: frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
