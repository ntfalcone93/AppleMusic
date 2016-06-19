//
//  ImageController.swift
//  HighCardMiniProject
//
//  Created by Nathan on 4/26/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class ImageController {
    
    // Fetches data at url and turns the data in an image
    static func imageForURL(url: NSURL, completion: (image: UIImage?) -> Void) {
        NetworkController.dataAtUrl(url) { (data) in
            guard let data = data else {completion(image: nil); return}
            let image = UIImage(data: data)
            dispatch_async(dispatch_get_main_queue(), {
                completion(image: image)
            })
        }
    }
}