//
//  VideoListItemView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let video: Video
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 9))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZSTACK
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
    }
}

//MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    let videos: [Video] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos.shuffled()[0])
        .padding()
}
