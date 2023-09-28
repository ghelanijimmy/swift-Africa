//
//  HeadingView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - PROPERTIES
    let headingImage: String
    let headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let headingImage = "photo.on.rectangle.angled"
    let headingText = "Wilderness in Pictures"
    return HeadingView(headingImage: headingImage, headingText: headingText)
        .padding()
}
