//
//  ViewController.swift
//  TestApp3
//
//  Created by RajenderPrasad Dubala on 9/6/17.
//  Copyright © 2017 bss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var eventsTable : UITableView!

    var events : [GiftEvent] = []
    
    var loadInd : Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //eventsTable.reloadData();
        //TODO: Get the events from REST API call
        //events.append(GiftEvent(name : "Tom's Birthday Event").addAmount(amount:60));
        //events.append(GiftEvent(name : "Baby shower Party for Cathy").addAmount(amount:150));
        //events.append(GiftEvent(name : "Hurricane Harvey Relief Fund").addAmount(amount:5000));
        //events.append(GiftEvent(name : "Project team building and happy hours").addAmount(amount:250));
        
        if loadInd {
            let url : String = "https://jsonplaceholder.typicode.com/users";
            HTTPHandler.getJson(urlString: url, completionHandler: processResponse);
            //loadInd = false;
        }
    }
    
    func processResponse(data: Data?) -> Void {
        if let data = data {
            print("Http Response Data: \(data)")
            let responseArray = JSONParser.parse(data: data)
            
            if let responseArray = responseArray {
                print("Http Response Objects Count: \(responseArray.count)")
                
                events = []
                
                for indx in 0...3 {
                    let dictionary = responseArray.object(at:indx) as? [String: AnyObject]
                    let name = dictionary!["name"] as! String;
                    events.append(GiftEvent(name : name).addAmount(amount:60));
                    //events[indx].name = dictionary!["name"] as! String
                    //print(events[indx].name)
                }
                
                DispatchQueue.main.async {
                    self.eventsTable.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendViewSegue" {
            let sendButton = sender as! UIButton
            let controller = segue.destination as! SendViewController
            controller.selectedEvent = events[sendButton.tag]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! EventsTableViewCell
        
        let indx : Int = indexPath.row;
        
        eventCell.sendButton.tag = indx;
        eventCell.eventName.text = events[indx].name;
        eventCell.amount.text = "$\(events[indx].amount)";
        
        return eventCell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

