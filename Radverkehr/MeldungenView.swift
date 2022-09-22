//
//  MeldungenView.swift
//  Radverkehr
//
//  Created by Benjamin Lassmann on 22.09.22.
//

import SwiftUI

struct MeldungenView: View {
    var body: some View {

        NavigationView{
            List{
                NavigationLink {
                    MeldungDetailsView()
                } label: {
                    ListItem()
                }

            }



            .navigationTitle("Aktuelles")
        }
    }
}

struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenView()
    }
}
