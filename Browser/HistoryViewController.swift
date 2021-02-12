//
//  HistoryViewController.swift
//  Browser
//
//  Created by Валентин Панин on 11.02.2021.
//

import UIKit



class HistoryViewController: UITableViewController {
    
    var searchLink: [String] = []
    
    private var mainView: HistoryView {
        return view as! HistoryView
    }
    
    override func loadView() {
        view = HistoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "History"
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
}

extension HistoryViewController: SearchViewControllerDelegate {
    
    func searchViewController(_ viewController: SearchViewController, searchLink link: String) {
        searchLink.append(link)
        tableView.reloadData()
    }
    
}

extension HistoryViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchLink.count
    }
}


extension HistoryViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = searchLink[indexPath.item]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}
