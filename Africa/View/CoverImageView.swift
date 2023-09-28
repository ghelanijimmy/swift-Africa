//
//  CoverImageView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-27.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
            
        } //: TABVIEW
        .tabViewStyle(.page)
    }
}

//MARK: - PREVIEW
#Preview(traits: .fixedLayout(width: 360, height: 300)) {
    CoverImageView()
}
