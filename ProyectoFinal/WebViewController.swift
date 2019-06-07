//
//  WebViewController.swift
//  PROYECTO_Alfa
//
//  Created by Dev2 on 04/06/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit
import WebKit

//class WebViewController: UIViewController, WKNavigationDelegate{
//
//    var webView: WKWebView!
//
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let url = URL(string: "https://www.google.es/")!
//        webView.load(URLRequest(url: url))
//
//
//        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
//        toolbarItems = [refresh]
//        navigationController?.isToolbarHidden = false
//    }
//
//
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }
//        // Do any additional setup after loading the view.
//    }
//
//
//
//
//
