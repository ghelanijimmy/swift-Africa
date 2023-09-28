//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        
        if let videoPlayer = videoPlayer {
            videoPlayer.play()
        }
        
    }
    return videoPlayer
}
