//
//  EventsTableViewCell.swift
//  TestApp3
//
//  Created by RajenderPrasad Dubala on 9/6/17.
//  Copyright © 2017 bss. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet var eventName : UILabel!
    
    @IBOutlet var amount : UILabel!
    
    @IBOutlet var sendButton : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
