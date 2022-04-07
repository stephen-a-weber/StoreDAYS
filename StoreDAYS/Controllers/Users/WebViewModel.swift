//
//  WebViewModel.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/7/22.
//

import Foundation
import WebKit
class WebViewModel: ObservableObject {
    let webView: WKWebView
    let url: URL
    
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSf89CF4RF6_GqANn1xVp2zqAqpmdO3ZhdZT6e6TmVF6F65mYA/viewform?vc=0&c=0&w=1&flr=0")!

        loadUrl()
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
    
    
    
}
