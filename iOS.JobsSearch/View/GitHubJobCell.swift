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
        label.textColor = .black
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
    
    func setUpViewConstraints() {
        addSubview(jobTitleLable)
        jobTitleLable.translatesAutoresizingMaskIntoConstraints = false
        jobTitleLable.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        jobTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
    }
}
