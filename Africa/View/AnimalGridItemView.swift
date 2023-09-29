//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-29.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let animal = animals.randomElement()
    return AnimalGridItemView(animal: animal!)
        .padding()
}
