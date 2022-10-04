import SwiftUI

struct MeldungenListView: View {
    let handler = MeldungenResponseHandler()
    @ObservedObject var meldungen: MeldungenResponseModel?

    var body: some View {
        ZStack{
            if let meldungen = meldungen {
                List(meldungen.results, id: \.self) { meldung in
                    NavigationLink {
                        MeldungDetailsView(meldung: meldung)
                    } label: {
                        MeldungListItem(title: meldung.title, subtitle: meldung.subtitle, status: meldung.status ?? .vorgesehen)
                    }
                    .navigationTitle("Aktuelles")
                }
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
}

struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenListView()
    }
}
