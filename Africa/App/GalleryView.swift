//
//  GalleryView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-27.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedAnimal: String = "lion"
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    //MARK: - BODY
    var body: some View {
        // MARK: - IMAGE
        VStack(alignment: .center, spacing: 13) {
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 8))
            
            // MARK: - SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn) { oldValue, newValue in
                    withAnimation(.easeIn) {
                        gridSwitch()
                    }
                }
        } //: VSTACK
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: - GRID
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { animal in
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .onTapGesture {
                            selectedAnimal = animal.image
                            haptics.impactOccurred()
                        }
                } //: LOOP
            } //: VGRID
            .onAppear {
                gridSwitch()
            }
            
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
        
    }
}

#Preview {
    GalleryView()
}
