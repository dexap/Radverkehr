import SwiftUI

struct MeldungenList: View {

    var body: some View {

        if let meldungen = meldungen {
            ZStack{
                List(meldungen.result, id: \.self.id) { meldung in
                    NavigationLink {
                        MeldungDetailsView(meldung: meldung)
                            .navigationBarBackButtonHidden(false)
                    } label: {
                        MeldungListItem(meldung: meldung)
                    }

                }}

        } else {
            LoadingView().task {
                meldungen = handler.getLocal()
//                do {
//                    if InternetConnectionManager.isConnectedToNetwork() {
//                        meldungen = try await handler.get()
//                    } else {
//                        meldungen = handler.getLocal()
//                    }
//                } catch {
//                    print(error)
//                }
            }
            .foregroundColor(Color("purple"))
        }

    }
}


struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenList()
    }
}
