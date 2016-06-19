//
//  PlayerController.swift
//  AppleMusic
//
//  Created by Nathan on 4/29/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation
import StoreKit
import MediaPlayer

class PlayerController {
    
    static let cloudSC = SKCloudServiceController()
    
    static let sharedPlayer = PlayerController()
    let controller = MPMusicPlayerController()
    
    static func requestStoreKitPermission(completion: (success: Bool) -> Void) {
        SKCloudServiceController.requestAuthorization { (authStatus) in
            if authStatus == SKCloudServiceAuthorizationStatus.Authorized {
                completion(success: true)
            } else {
                completion(success: false)
            }
        }
    }
    
    static func requestCapabilities(completion: (success: Bool) -> Void) {
        cloudSC.requestCapabilitiesWithCompletionHandler { (capabilities, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(success: false)
            } else {
                if capabilities == SKCloudServiceCapability.None {
                    print("The user did not grant service capabilities")
                    completion(success: false)
                } else {
                    completion(success: true)
                }
            }
        }
    }
    
    static func fetchUsersMusic(completion: (success: Bool) -> Void) {
        
    }
    
    static func setupMediaPlayer() {
        let trackID = "1108737253"
        let controller = MPMusicPlayerController()
        controller.setQueueWithStoreIDs([trackID])
        controller.play()
    }
    
    func playTrack(trackId: String) {
        controller.setQueueWithStoreIDs([trackId])
        controller.play()
    }
}