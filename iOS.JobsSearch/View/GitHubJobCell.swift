//
//  GitHubJobCell.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import Foundation
import UIKit

class GitHubJobCell: UITableViewCell {
    
    let jobTitleLable : UILabel = {
        let label = UILabel()
        label.font =  .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let jobTypeLabel : UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let jobCompanyLabel : UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()
    
    let jobLocatinLabel : UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    let jobDataLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray2
        label.numberOfLines = 0
        return label
    }()
    
    // "title": "Software Developer " - "type": "Full Time",
    //    "company": "ScriptDrop" - "location": "Remote ",
    //    "created_at": "Tue Jan 19 20:31:59 UTC 2021",
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: GitHubJobsModel) {
        jobTitleLable.text = model.title
        jobTypeLabel.text = model.type
        jobCompanyLabel.text = model.company
        jobLocatinLabel.text = model.location
        jobDataLabel.text =  "Tue Jan 19 15:27:41 UTC 2021" // model.createdAt
//        cell.detailTextLabel?.text = jobResults[indexPath.row].createdAt

    }
    
    
    func setUpViewConstraints() {
        addSubview(jobTitleLable)
        jobTitleLable.translatesAutoresizingMaskIntoConstraints = false
        jobTitleLable.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        jobTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        jobTitleLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(jobTypeLabel)
        jobTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        jobTypeLabel.topAnchor.constraint(equalTo: jobTitleLable.bottomAnchor).isActive = true
        jobTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor ,constant: 5).isActive = true
        
        addSubview(jobCompanyLabel)
        jobCompanyLabel.translatesAutoresizingMaskIntoConstraints = false
        jobCompanyLabel.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor).isActive = true
        jobCompanyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        addSubview(jobLocatinLabel)
        jobLocatinLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLocatinLabel.topAnchor.constraint(equalTo: jobTypeLabel.bottomAnchor).isActive = true
        jobLocatinLabel.leadingAnchor.constraint(equalTo: jobCompanyLabel.trailingAnchor,constant: 2).isActive = true
        
        addSubview(jobDataLabel)
        jobDataLabel.translatesAutoresizingMaskIntoConstraints = false
        jobDataLabel.topAnchor.constraint(equalTo: jobCompanyLabel.bottomAnchor, constant: 2).isActive = true
        jobDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        jobDataLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
}
