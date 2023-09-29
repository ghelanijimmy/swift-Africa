//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - PROPERTIES
    let location: Location
    @State private var animation: Double = 0.0
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
            
        } //: ZSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let locations: [Location] = Bundle.main.decode("locations.json")
    let location = locations.shuffled()[0]
    return /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
        MapAnnotationView(location: location)
            .padding()
    }
}
