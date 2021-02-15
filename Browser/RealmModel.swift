//
//  RealmModel.swift
//  Browser
//
//  Created by Валентин Панин on 15.02.2021.
//

import Foundation
import RealmSwift


class RealmModel: Object {
    
    @objc dynamic var searchLink: String = ""
    @objc dynamic var id: String = ""
   
    convenience init(searchLink: String) {
        self.init()
        self.searchLink = searchLink
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
