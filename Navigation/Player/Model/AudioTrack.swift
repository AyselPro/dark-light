//
//  AudioTrack.swift
//  AVFoundation_Audio
//
//  Created by Aysel on 13.02.2024.
//

import Foundation

enum Filetype: String {
    case mp3 = "mp3"
    case m4a = "m4a"
}

struct AudioTrack {
    var artist: String
    var title: String
    var filename: String
    var filetype: Filetype
}
