//
//  NetworkController.swift
//  DeckOfCards
//
//  Created by Nathan on 3/29/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    static func dataAtUrl(url: NSURL, completion:(data: NSData?) -> Void) {
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            if let error = error {
                print("Error getting data at url: \(error.localizedDescription)")
                completion(data: nil)
            } else {
                if let data = data {
                    completion(data: data)
                } else {
                    print("Could not retrieve data at url")
                    completion(data: nil)
                }
            }
        }
        dataTask.resume()
    }
    
    static func serializeJsonData(data: NSData) -> AnyObject? {
        do {
            let jsonAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            return jsonAnyObject
        } catch {
            return nil
        }
    }
}