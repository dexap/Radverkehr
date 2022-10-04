
import SwiftUI

struct MeldungListItem: View {

    @State var meldung: MeldungenResponseModel.Results

    var body: some View {
        HStack {
            let circle = Circle()
                .frame(width: 25, height: 25, alignment: .center)
            switch (meldung.status) {
                case .inPlanung: circle.foregroundColor(.yellow)
                case .abgeschlossen: circle.foregroundColor(.green)
                case .inBau: circle.foregroundColor(.blue)
                case .vorgesehen: circle.foregroundColor(.gray)
                default:
                    circle.foregroundColor(.gray)
            }

                
            VStack(alignment: .leading){
                Text(meldung.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("purple"))
                    .lineLimit(3)
                Text(meldung.subtitle)
                    .lineLimit(3)
                    .font(.caption)
            }
            .padding(6)
        }
    }
}

struct MeldungListItem_Previews: PreviewProvider {
    static var previews: some View {
        MeldungListItem(meldung: previewModel.results[0])
    }
}
