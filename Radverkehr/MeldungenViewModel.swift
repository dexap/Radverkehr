import Foundation

class MeldungenViewModel: ObservableObject {
    @Published private(set) var meldungen: MeldungenModel
    private let handler: MeldungenResponseHandler

    init(model: MeldungenModel){
        meldungen = previewModel
        handler = MeldungenResponseHandler()
    }

    func reload() async {
        do{
            
            meldungen = try await handler.getData() ?? previewModel
        } catch {
            print(error)
        }
    }


}
