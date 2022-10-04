import Foundation


class MeldungenResponseHandler: ObservableObject {


    func getLocal() -> MeldungenViewModel? {
        guard let path = Bundle.main.path(forResource: "Projekte", ofType: "json") else {return nil}
        let url = URL(fileURLWithPath: path)

        var result: MeldungenViewModel?
        do{
            let data = try Data(contentsOf: url)
            result = try JSONDecoder().decode(MeldungenViewModel.self, from: data)

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


    @Published private(set) var result: MeldungenViewModel?

    func getData() async throws -> MeldungenViewModel?  {
        if let url = URL(string: "https://www.infravelo.de/api/v1/projects/") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        self.result = try jsonDecoder.decode(MeldungenViewModel.self, from: data)
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

    func get() async throws -> MeldungenViewModel? {
        do{
            result = try await getData()
            return result
        }catch {
            print(error)
        }
        return nil
    }
}
