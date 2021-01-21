
//
//  GitHubVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//


import UIKit

class GitHubVC : UIViewController {
    
    var tableView = UITableView()
    var reuseIdentifier = "cell"
    var serwice = Service()
    var jobsData = [GitHubJobsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
        setupViewConstraints()
        loadData()
        
    }
    
    func setupTableView() {
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubJobCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    func setupViewConstraints () {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func loadData() {
        serwice.getJASON {
            data in
            self.jobsData = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
extension GitHubVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GitHubJobCell
//        cell.jobTitleLable.text = jobsData[indexPath.row].title
        let model = jobsData[indexPath.row]
        cell.update(model: model)
        return cell
    }
    
    
}
