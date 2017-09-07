//
//  JSONParser.swift
//  TestApp3
//
//  Created by RajenderPrasad Dubala on 9/6/17.
//  Copyright © 2017 bss. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse (data: Data) -> NSArray? {
        
        let options = JSONSerialization.ReadingOptions()
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as! NSArray
            return json
        } catch (let parseError){
            print("There was an error parsing the JSON: \"\(parseError.localizedDescription)\"")
        }
        
        return nil
    }
}
