//
//  LiveSteamView.swift
//  StoreDAYS
//
//  Created by admin on 4/21/22.
//

import SwiftUI
import AVKit
struct LiveSteamView: View {
   
    private let player = AVPlayer(url: URL(string: "http://iphone-streaming.ustream.tv/uhls/17074538/streams/live/iphone/playlist.m3u8")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player.play()
            }
    }
    
}

struct LiveSteamView_Previews: PreviewProvider {
    static var previews: some View {
        LiveSteamView()
    }
}
