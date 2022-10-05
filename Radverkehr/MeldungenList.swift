import SwiftUI

struct MeldungenList: View {
    @ObservedObject var viewModel: MeldungenViewModel

    var body: some View {
        List(viewModel.meldungen.result, id: \.id) { meldung in
            NavigationLink {
                MeldungenList(viewModel: viewModel)
            } label: {
                MeldungenList(viewModel: viewModel)
            }
        }
        .refreshable {
            await viewModel.reload()
        }

    }
}


struct MeldungenView_Previews: PreviewProvider {
    static var previews: some View {
        MeldungenList(viewModel: .init(model: previewModel))
    }
}
