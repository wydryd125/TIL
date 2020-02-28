//
//  Songs.swift
//  itunesMusicPlayer
//
//  Created by 정유경 on 2020/02/28.
//  Copyright © 2020 정유경. All rights reserved.
//

import Foundation

struct Songs: Decodable {
  let resultCount: Int
  let results: [Song]
    
  struct Song: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let previewUrl: String
  }
}
