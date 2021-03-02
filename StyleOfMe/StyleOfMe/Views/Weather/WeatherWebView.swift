//
//  WeatherWebView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/1/21.
//

import Foundation
import UIKit
import WebKit
var testurl = "test"
class WeatherWebView: UIViewController {
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        
        guard let url = URL(string: testurl) else { return }
        let stud = URL(string: "https://www.foxnews.com/us/george-floyd-minneapolis-backtracks-social-media-influencer-derek-chauvin-trial")!
        webView.load(URLRequest(url: stud))
        
    }
    
}
