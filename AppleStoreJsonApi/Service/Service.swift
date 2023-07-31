//
//  Service.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 17/07/2023.
//

import Foundation

class Service {
    static let shared = Service() // singleton object
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
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
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch social apps")
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(objects, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }.resume()
    }
}
