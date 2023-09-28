//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    let video: String
    let videoTitle: String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: video, fileFormat: "mp4")) {
//                Text(videoTitle)
            } //: VIDEO PLAYER
            .overlay(
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8),
                alignment: .topLeading
            )
        } //: VSTACK
        .tint(.accent)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let videos: [Video] = Bundle.main.decode("videos.json")
    let video = videos.shuffled()[0]
    
    return NavigationStack {
        VideoPlayerView(video: video.id, videoTitle: video.name)
    }
}
