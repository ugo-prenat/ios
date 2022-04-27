//
//  MoviePageViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 26/04/2022.
//

import UIKit
import AVKit

class MoviePageViewController: UIViewController {

//    var movie = Movie(json: [
//                  "title":"Vikings",
//                  "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4"
//            ])
    
    var movie: Movie? = Movie(json: [
        "title":"Vikings",
        "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4"
    ])
    
    let videoUrl = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = movie?.title
        print(movie)
        
        
    }
    
    func playVideo() {
        let url: URL = URL(string: videoUrl)!
        playerView = AVPlayer(url: url as URL)
        playerViewController.player = playerView
        
        self.present(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        playVideo()
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
