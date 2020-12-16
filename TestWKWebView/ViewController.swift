//
//  ViewController.swift
//  TestWKWebView
//
//  Created by hoishing on 10/6/2017.
//  Copyright © 2017 FBM Development. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKScriptMessageHandler {

    @IBOutlet var webV: WKWebView!
    
    @IBAction func showJSAlert(_ sender: Any) {
//        let js = "hideText();"
        let js = "testMeAdam();"
        webV.evaluateJavaScript(js) { (result, error) in
            print(result)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webV.configuration.userContentController.add(self, name: "jsHandler")
//        webV.load(URLRequest(url: URL(string: "https://proto.emogi.com/appbits/ticktacktoe/dist/index.html")!))
        
        
        let bundleURL = Bundle.main.resourceURL!.absoluteURL.appendingPathComponent("tic-tac-toe").appendingPathComponent("dist")
        let html = bundleURL.appendingPathComponent("index.html")
        webV.loadFileURL(html, allowingReadAccessTo:bundleURL)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jsHandler" {
            print(message.body)
        }
    }
}
