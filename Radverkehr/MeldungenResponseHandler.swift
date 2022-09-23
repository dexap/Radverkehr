import Foundation


class MeldungenResponseHandler: ObservableObject {

    var parsedJSON: MeldungenResponseModel?

    func readLocalJSONFile() -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: "Projekte", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }

    func parseJSONtoMeldungResponseModel(data: Data) throws -> MeldungenResponseModel? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(MeldungenResponseModel.self, from: data)
        } catch {
            print(error)
        }
        print("error Parsing JSON")
        return nil
    }



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




    func get() async throws -> MeldungenResponseModel?  {
        if let url = URL(string: "https://www.infravelo.de/api/v1/projects/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.parsedJSON = try jsonDecoder.decode(MeldungenResponseModel.self, from: data)
                        print(self.parsedJSON?.results ?? "no data")
                        } catch {
                        print(error)
                    }
                }
            }.resume()
        } else {
            fatalError("Fetching URL error")
        }
        return parsedJSON as MeldungenResponseModel?
    }
}
