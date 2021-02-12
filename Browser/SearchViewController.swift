//
//  ViewController.swift
//  Browser
//
//  Created by Валентин Панин on 11.02.2021.
//

import UIKit
import WebKit

protocol SearchViewControllerDelegate: class {
        
    func searchViewController(_ viewController: SearchViewController, searchLink link: String)
}

class SearchViewController: UIViewController, WKUIDelegate, UISearchBarDelegate {
    
    var webView: WKWebView!
    weak var delegate: SearchViewControllerDelegate?
    var searchController: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.barStyle = .black
        search.showsCancelButton = true
        return search
   }()
    
    
    
    private var mainView: SearchView {
        return view as! SearchView
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchController
        searchBarSearchButtonClicked(searchController)
        searchController.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchbar: UISearchBar) {
        searchbar.resignFirstResponder()

        let dncode = searchController.text

        if ((dncode?.starts(with: "http://")) != nil) || (((dncode?.starts(with: "https://")) ) != nil) {
            loadUrl(dncode!)
            delegate?.searchViewController(self, searchLink: dncode!)
        } else if ((dncode?.contains("www")) != nil){
            loadUrl("http://\(dncode!)")
            delegate?.searchViewController(self, searchLink: dncode!)
        }
    }
    
    func loadUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
}


