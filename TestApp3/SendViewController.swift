//
//  SendViewController.swift
//  TestApp3
//
//  Created by RajenderPrasad Dubala on 9/7/17.
//  Copyright © 2017 bss. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {
    
    @IBOutlet var eventName : UILabel!
    
    @IBOutlet var amount : UILabel!
    
    var selectedEvent : GiftEvent!

    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = selectedEvent.name
        amount.text = "$\(selectedEvent.amount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
