import SwiftUI

struct MeldungenView: View {
    let handler = MeldungenResponseHandler()
    @State var meldungen: MeldungenResponseModel?

    var body: some View {

            if let meldungen = meldungen {
                List(meldungen.results, id: \.self.id) { meldung in
                    NavigationLink {
                        MeldungDetailsView(meldung: meldung)
                    } label: {
                        MeldungListItem(title: meldung.title, subtitle: meldung.subtitle, status: meldung.status ?? .vorgesehen)
                    }
                }
            } else {
                ProgressView().task {
                    meldungen = handler.getLocal()
                }
            }
    }
}

struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenView()
    }
}
