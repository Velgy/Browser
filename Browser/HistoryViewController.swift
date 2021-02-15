//
//  HistoryViewController.swift
//  Browser
//
//  Created by Валентин Панин on 11.02.2021.
//

import UIKit
import RealmSwift


class HistoryViewController: UIViewController {
    
    var searchLink: [RealmModel] = []
    private var token: NotificationToken?
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
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        updateCurrency()
    }
    
    func updateCurrency() {
        do {
            let realm = try Realm()
            
            let searchLink = realm.objects(RealmModel.self)
            token = searchLink.observe({ change in
                switch change {
                
                case .initial(let objects):
                    self.searchLink = Array(objects)
                    self.mainView.tableView.reloadData()
                case .update(let objects, deletions: _, insertions: _, modifications: _):
                    self.searchLink = Array(objects)
                    self.mainView.tableView.reloadData()
                case .error(let error):
                    print(error)
                }
            })
            
        } catch {
            print(error)
        }
    }
}

extension HistoryViewController: SearchViewControllerDelegate {
    
    func searchViewController(_ viewController: SearchViewController, searchLink link: String) {
        
        mainView.tableView.reloadData()
        
        let searchLink = RealmModel(searchLink: link)
        
        do {
            let realm = try Realm()
            
            try realm.write{
                realm.add(searchLink, update: .all)
            }
        } catch {
            print("error")
        }
        //searchLink.append(link)
    }
}

extension HistoryViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchLink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = searchLink[indexPath.item].searchLink
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}


extension HistoryViewController: UITableViewDelegate {
    
}
