//
//  walmartWebView.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/19/22.
//

import SwiftUI
import WebKit

struct walmartWebView:  UIViewRepresentable {
          typealias UIViewType = WKWebView

          let webView: WKWebView
          
          func makeUIView(context: Context) -> WKWebView {
              return webView
          }
          
          func updateUIView(_ uiView: WKWebView, context: Context) { }
      }

struct WalmartPayView: View {
    
    @StateObject var model = WalmartViewModel()
    
    var body: some View {
        WebView(webView: model.webView)
    }
}

class WalmartViewModel: ObservableObject {
    let webView: WKWebView
    let url: URL
    
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "https://www.walmart.com/cp/walmart-pay/3205993")!

        loadUrl()
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}


struct walmartWebView_Previews: PreviewProvider {
    static var previews: some View {
        WalmartPayView()
    }
}
