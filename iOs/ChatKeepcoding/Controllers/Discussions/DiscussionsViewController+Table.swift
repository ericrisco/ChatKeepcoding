//
//  DiscussionsViewController+Table.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 30/03/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import UIKit

extension DiscussionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func initFetch(){
        
        self.discussionsTable.delegate = self
        self.discussionsTable.dataSource = self
        
        let manager = DiscussionInteractor.init(manager: DiscussionFirebase()).manager
        manager.list(onSuccess: { (discussions) in
            self.discussions = discussions
            self.discussionsTable.reloadData()
        }) { (error) in
            print(error)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.discussions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "discussionCell", for: indexPath) as? DiscussionCell else {
            return DiscussionCell()
        }
        cell.discussion = discussions[indexPath.row]
        return cell
        
    }
    
    
}
