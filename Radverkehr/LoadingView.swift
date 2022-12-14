//
//  LoadingView.swift
//  WeatherApp_tut (iOS)
//
//  Created by Benjamin Lassmann on 28.12.21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color("purple")))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
