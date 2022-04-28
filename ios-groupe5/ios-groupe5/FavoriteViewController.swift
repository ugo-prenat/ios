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
        
        let rawMovie = Movie(json: [
            "title": "TITLE 2",
            "category":"series",
            "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab",
            "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4",
            "duration":"45min",
            "description":"Cette série réaliste s'attache aux exploits du héros Ragnar Lothbrok qui ambitionne d'étendre le pouvoir viking à la faveur d'un chef manquant de vision politique.",
            "releaseDate":"2019",
            "pegi":"16+"
        ])
        
        
//        if var movies = UserDefaults.standard.array(forKey: "movies") {
//            print(movies)
//            movies.append(movie)
//            UserDefaults.standard.set(movies as [Any], forKey: "movies")
//            print(movies)
//        }
        
        //GET ET SET
        /*var loadedTasks: [[String: Any]] {
            get {
                return UserDefaults.standard.array(forKey: "movies") as? [Any] ?? []
            }
            set {
                UserDefaults.standard.set(newValue as [Any], forKey: "movies")
            }
        }*/
        

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
