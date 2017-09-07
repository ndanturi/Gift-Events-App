//
//  GiftEvent.swift
//  TestApp3
//
//  Created by RajenderPrasad Dubala on 9/6/17.
//  Copyright © 2017 bss. All rights reserved.
//

import Foundation

class GiftEvent {
    
    var id : Int = 0;
    
    var name : String = "";
    
    var amount : Int = 0;
    
    var type : String = "eGift";
    
    var description : String = "";
    
    var emailAddress = "";
    
    var physicalAddress = "";
    
    var invitees : [String] = [];
    
    init(name: String) {
        self.name = name;
    }
    
    convenience init(name: String, address:String) {
        self.init(name: name);
        self.emailAddress = address;
    }
    
    convenience init(name: String, type: String, address:String) {
        self.init(name: name);
        if type == "eGift" {
            self.emailAddress = address;
        } else {
            self.type = type;
            self.physicalAddress = address;
        }
    }
    
    convenience init(name: String, address:String, invitees : [String]) {
        self.init(name: name, address: address);
        for invitee in invitees {
            self.invitees.append(invitee);
        }
    }
    
    convenience init(name: String, type: String, address:String, invitees : [String]) {
        self.init(name: name, type: type, address: address);
        for invitee in invitees {
            self.invitees.append(invitee);
        }
    }
    
    func addInvitees(invitees : [String]) -> Void {
        for invitee in invitees {
            self.invitees.append(invitee);
        }
    }
    
    func addAmount(amount : Int) -> GiftEvent {
        self.amount += amount;
        return self;
    }

}
