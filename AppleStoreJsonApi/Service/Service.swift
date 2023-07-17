//
//  Service.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 17/07/2023.
//

import Foundation

class Service {
    static let shared = Service() // singleton object
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}

        // fetch data from the internet
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch apps:", error)
                completion([], nil)
                return;
            }
            // success
            guard let data = data else { return }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonError {
                print("Failed to decode data", jsonError)
                completion([], jsonError)
            }

        }.resume() // fires off the request
    }
}
