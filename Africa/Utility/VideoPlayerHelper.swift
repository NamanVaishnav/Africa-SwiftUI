//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Naman Vaishnav on 31/07/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormate: String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormate) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
        
    }
    return videoPlayer!
}
