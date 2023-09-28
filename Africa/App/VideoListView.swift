//
//  VideoListView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-27.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) {video in
                    NavigationLink(
                        destination:
                            VideoPlayerView(
                                video: video.id,
                                videoTitle: video.name
                            )
                    ) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    } // NAVIGATION LINK
                } //: LOOP
            } //: LIST
            .listStyle(.grouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // SHUFFLE VIDEOS
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            })
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
#Preview {
    VideoListView()
}
