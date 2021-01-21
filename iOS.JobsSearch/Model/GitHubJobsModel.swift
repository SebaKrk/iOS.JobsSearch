//
//  GitHubJobsModel.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import Foundation

struct GitHubJobsModel:Codable {
    
    var type: String?
    var url: String?
    var createdAt: String?
    var company: String
    var companyUrl: String?
    var location: String?
    var title: String
    var description: String?
    var howToApply: String?
    var companyLogo: String?

}
// https://jobs.github.com/api
