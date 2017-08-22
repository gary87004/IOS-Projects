//
//  MainTableViewController.swift
//  SearchBar
//
//  Created by  Yo on 2017/8/22.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchResultsUpdating{
    var PlayerName = ["Russell Westbrook","James Harden","Isaiah Thomas","Anthony Davis","DeMar DeRozan","Hassan Whiteside","Andre Drummond","DeAndre Jordan","Rudy Gobert","Dwight Howard","John Wall","Chris Paul","Ricky Rubio","Myles Turner","Kristaps Porzingis","Draymond Green","Robert Covington","Jimmy Butler","Stephen Curry","Klay Thompson","Eric Gordon","Kyle Korver","LeBron James","DeMarcus Cousins","Jason Kidd","Kevin Durant","Giannis Antetokounmpo","Kyrie Irving","Derrick Rose","Karl-Anthony Towns"]
    
    var nbaplayers:[NBAPlayer] = [
        NBAPlayer(name:"Russell Westbrook"),NBAPlayer(name:"James Harden"),NBAPlayer(name:"Isaiah Thomas"),NBAPlayer(name:"Anthony Davis"),NBAPlayer(name:"DeMar DeRozan"),NBAPlayer(name:"Hassan Whiteside"),NBAPlayer(name:"Andre Drummond"),NBAPlayer(name:"DeAndre Jordan"),NBAPlayer(name:"Rudy Gobert"),NBAPlayer(name:"Dwight Howard"),NBAPlayer(name:"John Wall"),NBAPlayer(name:"Chris Paul"),NBAPlayer(name:"Ricky Rubio"),NBAPlayer(name:"Myles Turner"),NBAPlayer(name:"Kristaps Porzingis"),NBAPlayer(name:"Draymond Green"),NBAPlayer(name:"Robert Covington"),NBAPlayer(name:"Jimmy Butler"),NBAPlayer(name:"Stephen Curry")]

    
    var player: NBAPlayer!
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    var filteredArray = [String]()
    
    
    
//    var searchResults: [NBAPlayer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
//        resultsController.tableView.delegate = self
//        resultsController.tableView.dataSource = self
        searchController.searchBar.placeholder = "Search your favorite player..."
//        searchController.dimsBackgroundDuringPresentation = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filteredArray = PlayerName.filter({ (PlayerName:String) -> Bool in
            
            
            if(PlayerName.localizedCaseInsensitiveContains(searchController.searchBar.text!)){
                let isMatch = PlayerName.localizedCaseInsensitiveContains(searchController.searchBar.text!)
                return isMatch
            }
            else{
                return false
            }
        })
        tableView.reloadData()
    }
//    func updateSearchResults(for searchController: UISearchController) {
//        
//        filteredArray = PlayerName.filter({ (PlayerName:String) -> Bool in
//            
//            
//            if(PlayerName.localizedCaseInsensitiveContains(searchController.searchBar.text!)){
//         
//                return true
//            }
//            else{
//                return false
//            }
//        })
//        resultsController.tableView.reloadData()
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive{
            return filteredArray.count
        }
        else{
            return PlayerName.count
        }
    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if tableView == resultsController.tableView{
//            return filteredArray.count
//        }
//        else{
//            return PlayerName.count
//        }
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cellIdentifier = "Cell"
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if searchController.isActive{
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        else{
            cell.textLabel?.text = PlayerName[indexPath.row]
        }
        // Configure the cell...
        
        return cell
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cellIdentifier = "Cell"
////        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//        let cell = UITableViewCell()
//        if tableView == resultsController.tableView{
//            cell.textLabel?.text = filteredArray[indexPath.row]
//        }
//        else{
//            cell.textLabel?.text = PlayerName[indexPath.row]
//        }
//        // Configure the cell...
//
//        return cell
//    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
