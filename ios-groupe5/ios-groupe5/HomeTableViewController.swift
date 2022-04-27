//
//  HomeTableViewController.swift
//  ios-groupe5
//
//  Created by Ugo on 26/04/2022.
//

import UIKit

class HomeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movies:[Movie] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let url = URL(string: "https://netswift.herokuapp.com")!

        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
               print(error!.localizedDescription)
           } else {
               if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                   if let items = json as? [[String: AnyObject]] {
                       
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

    // MARK: - Table view data source

   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = self.movies[indexPath.row].title
        
        
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor.lightGray
//        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "moviePage") as? MoviePageViewController {
            //vc.linkBrowser = browsers[indexPath.row]
            vc.movie = movies[indexPath.row].title
            
            present(vc, animated: true, completion: nil)
//            navigationController?.pushViewController(vc, animated: true)
        }
    }

}


