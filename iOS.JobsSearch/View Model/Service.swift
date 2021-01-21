//
//  Service.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import Foundation

class Service {
    
    func getJASON(completed: @escaping ([GitHubJobsModel]) -> ()) {
        let urlString = "https://jobs.github.com/positions.json?description=ios"
        let url = URL(string: urlString)
        let request =  URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decodeData = try JSONDecoder().decode([GitHubJobsModel].self, from: data)
                completed(decodeData)
                print(decodeData)
            } catch {
                print("error masage: \(error)")
            }
        }
        task.resume()
    }
}

