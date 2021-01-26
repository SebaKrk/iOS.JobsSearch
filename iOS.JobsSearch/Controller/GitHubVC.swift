
//
//  GitHubVC.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//


import UIKit
import SafariServices

class GitHubVC : UIViewController {
    
    let logoButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 50
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        
        button.setBackgroundImage(#imageLiteral(resourceName: "github"), for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(handleLogoButton), for: .touchUpInside)
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    
    var tableView = UITableView()
    var reuseIdentifier = "cell"
    var serwice = Service()
    var jobsData = [GitHubJobsModel]()
    
//    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        setUpGradientLayer()
        setUpLogo()
      
        
    }
    @objc func handleLogoButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.logoButton.alpha = 0
        }, completion: { done in
            if done {
                self.setupTableView()
            }
        })
    }
    
    func setUpLogo() {
        view.addSubview(logoButton)
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setUpGradientLayer() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
//    MARK: - SetTableView
   
    
    func setupTableView() {
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GitHubJobCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        setupViewConstraints()
        loadData()
    }
    func setupViewConstraints () {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
//    MARK: - JSON
    
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
// MARK: - TableView

extension GitHubVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GitHubJobCell
        
        let model = jobsData[indexPath.row]
        cell.update(model: model)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}
// MARK: - SafariService

extension GitHubVC: SFSafariViewControllerDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: jobsData[indexPath.row].url!)! as URL)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}

