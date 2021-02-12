//
//  HistoryView.swift
//  Browser
//
//  Created by Валентин Панин on 11.02.2021.
//

import UIKit

class HistoryView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
