//
//  FavoriteViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 27/04/2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        
        // Get the favorites movies list
        let favMovies = defaults.array(forKey: "movies") as? [Movie] ?? [Movie]()
        
        
        let movie: Movie? = Movie(json: [
            "title": "Vikings",
            "category":"series",
            "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab",
            "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4",
            "duration":"45min",
            "description":"Cette série réaliste s'attache aux exploits du héros Ragnar Lothbrok qui ambitionne d'étendre le pouvoir viking à la faveur d'un chef manquant de vision politique.",
            "releaseDate":2019,
            "pegi":"16+"
        ])
        
        
//        let v: [Movie] = []
//        v.append(movie)
//        
//        
//        favMovies.append(movie)
//        print(favMovies)
        
        //defaults.set(favMovies, forKey: "movies")
        
        
        
        
        
        
        // Do any additional setup after loading the view.
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
