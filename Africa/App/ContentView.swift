//
//  ContentView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-27.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    func gridSwitch(reset: Bool = false) {
        if(reset) {
            gridLayout = Array(repeating: .init(.flexible()), count: 1)
            gridColumn = 1
            toolbarIcon = "square.grid.2x2"
        } else {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
            
            switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                            .padding(.vertical)
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            } //: NAVIGATION LINK
                        } //: FOR EACH
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) {animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                    } //: SCROLL
                } //:CONDITION
            } //: GROUP
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            withAnimation(.easeIn){
                                isGridViewActive = false
                                gridSwitch(reset: true)
                            }
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accent)
                        })
                        
                        // GRID
                        Button(action: {
                            withAnimation(.easeIn){
                                isGridViewActive = true
                                gridSwitch()
                            }
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accent : .primary)
                        })
                    } //: HSTACK
                } //: TOOLBAR ITEM
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

#Preview {
    ContentView()
}
