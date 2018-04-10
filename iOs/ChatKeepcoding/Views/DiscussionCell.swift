//
//  DiscussionCell.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 21/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import UIKit

class DiscussionCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    private var _discussion = Discussion.init()
    var discussion: Discussion {
        get{
            return _discussion
        }
        set{
            _discussion = newValue
            titleLabel.text = _discussion.title
            lastMessageLabel.text = _discussion.lastMessage
        }
    }
    
}
