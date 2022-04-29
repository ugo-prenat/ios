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
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var shareImageButton: UIImageView!
    @IBOutlet weak var playMoovieImageButton: UIImageView!
    @IBOutlet weak var favBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = movie?.title
        pegi.text = movie?.pegi
        duree.text = movie?.duration
        desc.text = movie?.description
        //releaseDate.text = movie?.releaseDate
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            shareImageButton.isUserInteractionEnabled = true
            shareImageButton.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
            playMoovieImageButton.isUserInteractionEnabled = true
            playMoovieImageButton.addGestureRecognizer(tapGestureRecognizer2)
        
        
        // Download and display image cover
        let coverUrl: String = movie?.cover as! String
        let url = URL(string: coverUrl)!
        if let data = try? Data(contentsOf: url) {
            cover.image = UIImage(data: data)
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
        
        let text = "Hey, as-tu regarder \(movie?.title ?? "") sur NetSwift ?\r \rTiens voici un lien pour y accéder directement ! \r \r\(movie?.url ?? "")"
        let activityViewController = UIActivityViewController.init(activityItems:[text], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        playVideo()
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
    
    @IBAction func toggleFav(_ sender: Any) {
        
        if favBtn.isSelected {
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
            favBtn.isSelected = false
        } else {
            favBtn.isSelected = true
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }
}
