//
//  VideoView.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 3/29/23.
//

import SwiftUI

import WebKit
struct VideoView: UIViewRepresentable{
    
    let videoID : String
    
    func makeUIView(context: Context) ->  WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://youtube.com/embed/\(videoID)") else {
            return
        }
        
        uiView.scrollView.isScrollEnabled = false

        uiView.load(URLRequest(url: youtubeURL))
        
    }
    
    
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoID: "live_stream?channel=UCmr3L3Wzc1SqhLVM4qEONbQ")
    }
}
