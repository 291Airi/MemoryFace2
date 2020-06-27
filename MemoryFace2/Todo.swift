//
//  Todo.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2019/12/07.
//  Copyright © 2019 福井　愛梨. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var textFieldString = ""
    @objc dynamic var hint1 = ""
    @objc dynamic var hint2 = ""
    @objc dynamic var pictureurl = ""
    }

