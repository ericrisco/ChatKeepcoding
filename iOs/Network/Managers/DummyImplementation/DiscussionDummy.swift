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
        
        let d1 = Discussion.init(uid: "0",
                                 title: "Firebase")
        
        let d2 = Discussion.init(uid: "1",
                                 title: "Clean Architecture")
        
        var discussions: [Discussion] = [Discussion]()
        
        discussions.append(d1)
        discussions.append(d2)
        
        discussions.sort { (d1, d2) -> Bool in return d1.title < d2.title }
        
        onSuccess(discussions)
        
    }
    
}
