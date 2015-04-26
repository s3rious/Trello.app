//
//  AppDelegate.swift
//  Trello
//
//  Created by Leonid Semenov on 18.04.15.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: WAYWindow!
    @IBOutlet weak var webview: WebView!


//    func NSColorFromRGB(rgbValue: UInt) -> NSColor {
//        return NSColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {

        // Make title bar transparent
        window.titlebarAppearsTransparent = true
        window.movableByWindowBackground  = true
        
        #if DEBUG
            // Allow to use webinspector
            let defs = NSUserDefaults.standardUserDefaults()
            defs.setBool(true, forKey: "WebKitDeveloperExtras")
            defs.synchronize()
        #endif
        
//        let bgColor = NSColorFromRGB(0x026AA7)
        
//        self.window.backgroundColor = bgColor
//        webview.setValue(false, forKey: "opaque")
//        webview.setValue(bgColor, forKey: "backgroundColor")
        
        let resourcesPath = NSBundle.mainBundle().resourcePath!
        let jsPath = resourcesPath.stringByAppendingString("/Trello.js")
        
        let urlPath: String = "https://www.trello.com/login"
        let url = NSURL(string: urlPath)!
        let request = NSURLRequest(URL: url)
        
        // Normal user agent shild be assingen to allow drag'n'drop
        let ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/600.5.17 (KHTML, like Gecko) Version/8.0.5 Safari/600.5.17"
        webview.customUserAgent = ua
        
        webview.policyDelegate = self
        webview.UIDelegate = self
        webview.frameLoadDelegate = self
        
        webview.mainFrame.loadRequest(request)
    }

    override func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        let path = NSBundle.mainBundle().pathForResource("Trello", ofType: "js")
        let jsCode = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
        webview.stringByEvaluatingJavaScriptFromString(jsCode)!
    }
    

    func applicationShouldHandleReopen(sender: NSApplication,
                                       hasVisibleWindows flag: Bool) -> Bool {

        if !flag {
            for window in sender.windows {
                if let w = window as? WAYWindow {
                    w.makeKeyAndOrderFront(self)
                }
            }
        }

        return true
    }


    func isLinkAnInternal(url: NSURL) -> Bool {
        let host = url.host!
        return host.hasSuffix("trello.com") || host.hasSuffix("accounts.google.com")
    }


    func openLinkWithinBrowser(url: NSURL) {
        NSWorkspace.sharedWorkspace().openURL(url)
    }


    override func webView(webView: WebView!,
                          decidePolicyForNavigationAction actionInformation: [NSObject : AnyObject]!,
                          request: NSURLRequest!,
                          frame: WebFrame!,
                          decisionListener listener: WebPolicyDecisionListener!) {
        let url = request.URL!
        if self.isLinkAnInternal(url) {
            listener.use();
        }
        else {
            listener.ignore();
            self.openLinkWithinBrowser(url)
        }
    }


    override func webView(webView: WebView!,
                          decidePolicyForNewWindowAction actionInformation: [NSObject : AnyObject]!,
                          request: NSURLRequest!,
                          newFrameName frameName: String!,
                          decisionListener listener: WebPolicyDecisionListener!) {
        self.openLinkWithinBrowser(request.URL!)
    }
}

