//
//  HomeViewController.swift
//  TwitterApp-UIKit
//
//  Created by DA MAC M1 157 on 2023/06/28.
//

import UIKit

class HomeViewController: UIViewController {
    
    // This is called anonymous closure function
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
    }

    // setting the frame for the tableView
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        timelineTableView.frame = view.frame
    }

}


// MARK: - Tableview Methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell  else { return UITableViewCell() }
        
        return cell
    }
    
}
