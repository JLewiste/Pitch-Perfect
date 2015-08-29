//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by JohannesLewiste on 8/15/15.
//  Copyright (c) 2015 MohdFirdause. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    
    var filePathUrl: NSURL!
    var title: String!
    
    // TODO: Initialize the RecordedAudio class
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}