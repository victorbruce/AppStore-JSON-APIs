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
    
    func fetchTopFreeApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopPaidApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    // helper
    func fetchAppGroup(urlString: String, completion: @escaping(AppGroup?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from the internet
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            // success
            guard let data = data else { return }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(appGroup, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }.resume() // fires off the request
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch social apps")
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let socialApp = try JSONDecoder().decode([SocialApp].self, from: data)
                completion(socialApp, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }.resume()
    }
}
