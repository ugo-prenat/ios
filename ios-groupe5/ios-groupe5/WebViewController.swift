//
//  WebViewController.swift
//  ios-groupe5
//
//  Created by Mickaël on 28/04/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var trailerUrl = "temp"
    
    var movie = Movie(json: [
        "title": "Vikings",
        "category":"series",
        "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab",
        "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4",
        "trailerUrl": "https://youtu.be/mAl60ykBm4A",
        "duration":"45min",
        "description":"Cette série réaliste s'attache aux exploits du héros Ragnar Lothbrok qui ambitionne d'étendre le pouvoir viking à la faveur d'un chef manquant de vision politique.",
        "releaseDate":2019,
        "pegi":"16+"
    ])

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadYtbTrailer(text: trailerUrl)
    }
    
    func loadYtbTrailer(text: String) {
            let url = URL(string: text)!
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
}
