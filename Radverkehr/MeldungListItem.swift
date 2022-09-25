
import SwiftUI

struct MeldungListItem: View {

    let title: String
    let subtitle: String
    let status: MeldungenResponseModel.Status

    var body: some View {
        HStack {

            let circle = Circle().frame(width: 25, height: 25, alignment: .center)
            switch (status) {
                case .inPlanung: circle.foregroundColor(.yellow)
                case .abgeschlossen: circle.foregroundColor(.green)
                case .inBau: circle.foregroundColor(.blue)
                case .vorgesehen: circle.foregroundColor(.gray)
                default:
                    circle.foregroundColor(.gray)
            }

                
            VStack(alignment: .leading){
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("purple"))
                    .lineLimit(3)
                Text(subtitle)
                    .lineLimit(3)
                    .font(.caption)
            }
            .padding(6)
        }
    }
}

struct MeldungListItem_Previews: PreviewProvider {
    static var previews: some View {
        MeldungListItem(title: "Frankfurter Allee", subtitle: "Sperrung auf der Frankfurter Allee. Zum Umfahren nutzen die sie Storkower Strasse", status: MeldungenResponseModel.Status.inPlanung )
    }
}
