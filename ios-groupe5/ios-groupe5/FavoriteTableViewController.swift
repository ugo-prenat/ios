//
//  FavoriteTableViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 28/04/2022.
//

import UIKit

class FavoriteTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var favMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getFavMovies()
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func getFavMovies() {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://netswift.herokuapp.com/fav")!
//        let url = URL(string: "http://localhost:8000/fav")!

        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
               print(error!.localizedDescription)
           } else {
               if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                   if let items = json as? [[String: Any]] {
                       
                       for item in items {
                           if let movie = Movie(json: item) {
                               self.favMovies.append(movie)
                           }
                       }
                   }
               }
           }
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
       }
       task.resume()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favMovies.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FavoriteTableViewCell

        cell.title.text = favMovies[indexPath.row].title
        cell.releaseDate.text = String(favMovies[indexPath.row].releaseDate)
        cell.pegi.text = favMovies[indexPath.row].pegi
        cell.duration.text = favMovies[indexPath.row].duration
        
        // Download and display image cover
        let url = URL(string: favMovies[indexPath.row].cover)!
        if let data = try? Data(contentsOf: url) {
            cell.cover.image = UIImage(data: data)
        }
        
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
    @IBAction func deleteFav(_ sender: Any) {
        print("delete movie")
    }
}
