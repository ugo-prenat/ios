//
//  WebViewController.swift
//  ios-groupe5
//
//  Created by Mickaël on 27/04/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
        
    var linkTrailer = "https://youtu.be/mAl60ykBm4A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadYtbTrailer(text: self.linkTrailer)
    }
    
    func loadYtbTrailer(text: String) {
        let url = URL(string: text)!
        let request = URLRequest(url: url)
        self.webView.load(request)
    }

    @IBAction func CloseTrailer(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
