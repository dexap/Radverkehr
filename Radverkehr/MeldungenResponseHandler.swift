import Foundation


class MeldungenResponseHandler: ObservableObject {

    @Published private var _isLoading = false
    var isLoading: Bool { get {_isLoading} }


    func getLocal() -> MeldungenResponseModel? {
        guard let path = Bundle.main.path(forResource: "Projekte", ofType: "json") else {return nil}
        let url = URL(fileURLWithPath: path)

        var result: MeldungenResponseModel?
        do{
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(MeldungenResponseModel.self, from: data)

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


    var result: MeldungenResponseModel?
    func getData() async throws -> MeldungenResponseModel?  {
        if let url = URL(string: "https://www.infravelo.de/api/v1/projects/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.result = try jsonDecoder.decode(MeldungenResponseModel.self, from: data)
                        if let result = self.result {
                            self.result = result
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        } else {
            fatalError("Fetching URL error")
        }
        return result
    }

    func get() async throws -> MeldungenResponseModel? {
        do{
            _isLoading = true
            result = try await getData()
            _isLoading = false
            return result
        }catch {
            print(error)
        }
        return nil
    }
}
