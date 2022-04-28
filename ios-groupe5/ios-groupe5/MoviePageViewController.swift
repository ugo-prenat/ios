//
//  MoviePageViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 26/04/2022.
//

import UIKit
import AVKit  

class MoviePageViewController: UIViewController {
    
    var movie: Movie? = Movie(json: [
        "title": "Vikings",
        "category":"series",
        "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab",
        "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4",
        "duration":"45min",
        "description":"Cette série réaliste s'attache aux exploits du héros Ragnar Lothbrok qui ambitionne d'étendre le pouvoir viking à la faveur d'un chef manquant de vision politique.",
        "releaseDate":"2019",
        "pegi":"16+"
    ])
    
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pegi: UILabel!
    @IBOutlet weak var duree: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = movie?.title
        pegi.text = movie?.pegi
        duree.text = movie?.duration
        desc.text = movie?.description
    }
    
    func playVideo() {
        
        if let videoUrl: String = movie?.url {
            
            let url: URL = URL(string: videoUrl)!
            playerView = AVPlayer(url: url as URL)
            playerViewController.player = playerView
            
            self.present(playerViewController, animated: true) {
                self.playerViewController.player?.play()
            }
        }
        
    }
    
    @IBAction func showWebView(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "webview") as? WebViewController {
            
            if let trailerUrl: String = movie?.trailerUrl {
                vc.trailerUrl = trailerUrl
                self.present(vc, animated: true, completion: nil)
            }
            
            
        }
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
