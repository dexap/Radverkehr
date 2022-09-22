//
//  ListItem.swift
//  Radverkehr
//
//  Created by Benjamin Lassmann on 22.09.22.
//

import SwiftUI

struct ListItem: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 25, height: 25, alignment: .center)
            VStack(alignment: .leading){
                Text("Frankfurter Allee")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.accentColor)
                    .lineLimit(3)
                Text("Sperrung auf der Frankfurter Allee. Zum Umfahren nutzen die sie Storkower Strasse")
                    .lineLimit(3)
                    .font(.caption)
            }
            .padding(6)
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem()
    }
}
