import SwiftUI

struct MeldungenListView: View {
    let handler = MeldungenResponseHandler()
    @State var meldungen: MeldungenResponseModel?

    var body: some View {

        if let meldungen = meldungen {
            ZStack{
                List(meldungen.results, id: \.self.id) { meldung in
                    NavigationLink {
                        MeldungDetailsView(meldung: meldung)
                    } label: {
                        MeldungListItem(meldung: meldung)
                    }
                    .navigationTitle("Aktuelles")
                }}

        } else {
            LoadingView().task {
                do {
                    if InternetConnectionManager.isConnectedToNetwork() {
                        meldungen = try await handler.get()
                    } else {
                        meldungen = handler.getLocal()
                    }
                } catch {
                    print(error)
                }
            }
            .foregroundColor(Color("purple"))
        }
    }
}


struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenListView()
    }
}
