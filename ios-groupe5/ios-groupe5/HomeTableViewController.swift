//
//  HomeTableViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 26/04/2022.
//

import UIKit

class HomeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movies:[Movie] = []
    
    @IBOutlet weak var searchTextFiled: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        

        fetchData(query: "")
    }
    
    func fetchData(query: String) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://netswift.herokuapp.com?q=\(query)")!
//        let url = URL(string: "http://localhost:8000")!

        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
               print(error!.localizedDescription)
           } else {
               if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                   if let items = json as? [[String: Any]] {
                       
                       for item in items {
                           if let movie = Movie(json: item) {
                               self.movies.append(movie)
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
        return self.movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HomeTableViewCell
        
        cell.title.text = movies[indexPath.row].title
        cell.releaseDate.text = String(movies[indexPath.row].releaseDate)
        cell.pegi.text = movies[indexPath.row].pegi
        cell.duration.text = movies[indexPath.row].duration
        
        // Download and display image cover
        let url = URL(string: movies[indexPath.row].cover)!
        if let data = try? Data(contentsOf: url) {
            cell.cover.image = UIImage(data: data)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "moviePage") as? MoviePageViewController {
            
            vc.movie = movies[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    @IBAction func searchQuery(_ sender: Any) {
        let search = searchTextFiled.text
        print(search!)
    }
}


