//
//  FavoriteTableViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 27/04/2022.
//

import UIKit

class FavoriteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let movie1: Movie = Movie(json: [
          "title":"Vikings",
          "category":"series",
          "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab",
          "url":"https://file-examples.com/storage/fef12739526267ac9a2b543/2017/04/file_example_MP4_1920_18MG.mp4",
          "trailerUrl":"https://youtu.be/mAl60ykBm4A",
          "duration":"45min",
          "description":"Cette série réaliste s'attache aux exploits du héros Ragnar Lothbrok qui ambitionne d'étendre le pouvoir viking à la faveur d'un chef manquant de vision politique.",
          "releaseDate":2019,
          "pegi":"16+"
    ])!
    let movie2: Movie = Movie(json: [
          "title":"The Big Bang Theory",
          "category":"series",
          "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABTe5Ok6xQUAl4vYOkTeSgJKMDlS5S3Jsbl-nWGobg6a1hblCYHSeqgQPluFtVizRr9nJQVExfVl2gzkK5IFMJKnKH7k.webp?r=bc4",
          "url":"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
          "trailerUrl":"https://youtu.be/rCj-Fb1OmXg",
          "duration":"32min",
          "description":"Deux jeunes physiciens et leurs amis geeks voient leur cercle social s'agrandir lorsqu'une actrice en herbe emménage dans l'appartement à côté du leur.",
          "releaseDate":2018,
          "pegi":"13+"
    ])!
    let movie3: Movie = Movie(json: [
          "title":"Inception",
          "category":"movie",
          "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABW9b6Ie6A9P-c3lBKZPd5XssEYzG69GTCxEevpVfkINEDdBgkbTQ1vUjcHKCTHvg9rYT3OJMBDvIO8dD1vnCxJIAVZ0.webp?r=bd6",
          "url":"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
          "trailerUrl":"https://youtu.be/RCmNCkIUot8",
          "duration":"2h28min",
          "description":"no description",
          "releaseDate":2010,
          "pegi":"13+"
    ])!
    let movie4: Movie = Movie(json: [
          "title":"The Walking Dead",
          "category":"series",
          "cover":"https://occ-0-6302-56.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABexI6hT4l9zeWIXJCeYzge9ah5SD6fcI5mZCzKEYn1L_CqcY2uBA6uugjxHhyGlwfptVbc_YkWUSOUrPvhOaeVkM-L8.webp?r=e82",
          "url":"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
          "trailerUrl":"https://www.youtube.com/watch?v=AbtiqJGhWyY",
          "duration":"67min",
          "description":"Dans un monde apocalyptique sous l'emprise des zombies, des rescapés se rassemblent afin de lutter pour leur survie et de préserver leur humanité.",
          "releaseDate":2019,
          "pegi":"18+"
    ])!
    
    
    var favMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        // Creating fav list
        favMovies.append(movie1)
        favMovies.append(movie2)
        favMovies.append(movie3)
        favMovies.append(movie4)
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.favMovies.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FavoriteTableViewCell

        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "moviePage") as? MoviePageViewController {
            
            vc.movie = favMovies[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
