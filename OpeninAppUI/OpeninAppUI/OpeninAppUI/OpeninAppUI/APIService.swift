import Foundation

class APIService {
    func fetchDashboardData(completion: @escaping (Result<DashboardResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        // Ensure there are no spaces or newlines in the token string
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("No data received.")
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }

            // Debugging: Print raw data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }

            do {
                let dashboardData = try JSONDecoder().decode(DashboardResponse.self, from: data)
                completion(.success(dashboardData))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
