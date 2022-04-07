//
//  FeedbackSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/6/22.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

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

struct FeedbackSwiftUIView: View {
    @State var model = WebViewModel()
    @State var animFlag3 = true
    @State var myColor = "myBlue"
    @State var messajeValidate = "Pls enter your feedback"
    @State private var profileText = "Enter your feedback:"
    var body: some View {
        VStack {
            
            
           
            
            Text(messajeValidate)
                .foregroundColor(Color(myColor))
                .frame(width: 300, height: 20, alignment: .center)
            
            WebView(webView: model.webView).frame(width: 400, height: 650, alignment: .center)
            Spacer()
            
            
        }.frame(width: 250, height: 250 )
    }
}

struct FeedbackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSwiftUIView()
    }
}
