//
//  DiscussionDummy.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 21/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation

public class DiscussionDummy: DiscussionManager {

    public func list(onSuccess: @escaping ([Discussion]) -> Void, onError: ErrorClosure?) {
        
        let d1 = Discussion.init(uid: "1", title: "Die Hard 1", lastMessage: "Yippie yay!")
        let d2 = Discussion.init(uid: "2", title: "Die Hard 2", lastMessage: "Clean architecture rocks!")
        
        var discussions = [Discussion]()
        
        discussions.append(d1)
        discussions.append(d2)
        
        onSuccess(discussions)
        
    }

}
