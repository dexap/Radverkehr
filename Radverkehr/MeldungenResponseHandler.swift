import Foundation


class MeldungenResponseHandler: ObservableObject {

    func getLocal() -> MeldungenModel? {
        guard let path = Bundle.main.path(forResource: "Projekte", ofType: "json") else {return nil}
        let url = URL(fileURLWithPath: path)

        var result: MeldungenModel?
        do{
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(MeldungenModel.self, from: data)

            if let result = result {
                return result
            } else {
                print("Error parsing JSON")
            }
        } catch {
            print("Error: \(error)")
            return nil
        }

        return nil
    }


    func getData() async throws -> MeldungenModel? {
        var model: MeldungenModel = .init(result: previewModel.result)
        if let url = URL(string: "https://www.infravelo.de/api/v1/projects/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        model = try JSONDecoder().decode(MeldungenModel.self, from: data)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        } else {
            fatalError("Fetching URL error")
        }
        return model
    }

}
