//
//  Category.swift
//  Todoey
//
//  Created by Djauhery on 18/8/18.
//  Copyright © 2018 Djauhery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
