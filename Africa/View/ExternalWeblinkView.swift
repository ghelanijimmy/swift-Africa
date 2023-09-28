//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(
                        animal.name,
                        destination:
                            URL(string: animal.link)
                            ?? URL(string: "https://wikipedia.org")!
                    )
                    
                    Image(systemName: "arrow.up.right.square")
                } //: GROUP
                .foregroundStyle(.accent)
            } //: HSTACK
        } //: GROUPBOX
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    return ExternalWeblinkView(animal: animals.shuffled()[0])
        .padding()
}
