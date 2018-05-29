//
//  Log.swift
//  Token1.1
//
//  Created by Karin Alsop on 5/28/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import UIKit
import SwiftMoment

enum tag: Int {
    case sober
    case usedAcceptably
    case used
}

struct Log {
    var date: Moment
    var tag: tag
    var textStorage: NSTextStorage?
    
    init(forDate date: Moment, tagged tag: tag, withEntry textStorage: NSTextStorage? = nil) {
        self.date = date
        self.tag = tag
        self.textStorage = textStorage
    }
}
