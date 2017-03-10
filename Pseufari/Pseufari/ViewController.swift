//
//  ViewController.swift
//  Pseufari
//
//  Created by Stuart Slack on 10/6/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    var restrictedDomains = [String]()

    @IBAction func bookmarksTapped(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var wv: UIWebView!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func onForwardButtonTap(sender: AnyObject) {
        wv.goForward()
    }
    
    @IBAction func onBackButtonTap(sender: AnyObject) {
        wv.goBack()
    }

    func loadRestrictedSites() {
        restrictedDomains = ["foxnews.com", "fortune.com"]
    }
    
    func isDomainRestricted(url: NSURL?) -> Bool {
        var shouldRestrict = false
        
        if let host = url?.host {
            for domain in restrictedDomains {
                if( host.containsString(domain) ) {
                    shouldRestrict = true
                    break
                }
            }
        }
        else {
            shouldRestrict = true
        }
        return shouldRestrict
    }

    func loadURL(theURL: String?) {
        
        var changed = false
        var myURL : String = String("");
        
        if( theURL == nil ) {
            myURL = "http://www.apple.com"
            changed = true;
        }
        else {
            myURL = theURL!;
        }
        
        if( theURL!.hasPrefix("http://") == false) {
            myURL = "http://" + theURL!
        }
        let charset = NSCharacterSet(charactersInString: " ")
        
        var rng = myURL.rangeOfCharacterFromSet(charset)
        while( rng != nil && rng!.count > 0 ) {
            myURL.removeRange(rng!);
            rng = myURL.rangeOfCharacterFromSet(charset)
        }
        
        if( !changed && myURL != theURL ) {
            changed = true
        }
        
        if( changed ) {
            print("The string was changed from \'" + theURL! + "\' to " + myURL);
            textField.text = myURL;
        }

//        let theDemoURL = NSURL(string: myURL)
//        if let url = theDemoURL {
//            let request = NSURLRequest(URL: url)
//            wv.loadRequest(request);
//        }
        // Variation to avoid piramid of doom
        if let theURL = NSURL(string:myURL) {
            let request = NSURLRequest(URL: theURL);
            wv.loadRequest(request);
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup
        self.loadRestrictedSites()
        
        forwardButton.enabled = false
        backButton.enabled = false
        
        textField.placeholder = "Web address"
        textField.text = "http://www.apple.com"
        textField.delegate = self;
        view.backgroundColor = UIColor(R:255, G:255, B:0)
        
        wv.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    /* TextField Delegate */
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        loadURL(textField.text)
        textField.resignFirstResponder()
        
        return true
    }
    
    /* WebView Delegate */
    func webViewDidFinishLoad(webView: UIWebView) {
        if( wv.canGoBack ) {
            backButton.enabled = true
        }
        else {
            backButton.enabled = false
        }
        if( wv.canGoForward ) {
            forwardButton.enabled = true
        }
        else {
            forwardButton.enabled = false
        }
        // What was the URL?
        let theRequest = wv.request

        textField.text = theRequest?.URL?.absoluteString
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return !self.isDomainRestricted(request.URL);
    }

}

