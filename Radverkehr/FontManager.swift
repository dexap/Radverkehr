// Family: Berlin Type Office Font names: ["BerlinTypeOffice-Regular", "BerlinTypeOffice-Bold"]


import Foundation
import SwiftUI

func getCustomFontNames() {
    // get each of the font families
    for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        // print array of names
        print("Family: \(family) Font names: \(names)")
    }
}

struct FontManager {
    struct BerlinFont {
        static let regular = "BerlinTypeOffice-Regular"
        static let bold = "BerlinTypeOffice-Bold"

    }
}
