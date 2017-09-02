//
//  MainTableViewController.swift
//  JsonTest
//
//  Created by  Yo on 2017/8/25.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class MainTableViewController: UITableViewController {


    @IBOutlet weak var NewTable: UITableView!

    
    var NameData  = [String]()
    var TypeData  = [String]()
    var SexData   = [String]()
    var ImageData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJson()


    }
    
    func GetJson(){
        let url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json["result"]["results"]["Name"])
                for i in 0...json["result"]["results"].count-1{
                    self.NameData = self.NameData + [String(describing: json["result"]["results"][i]["Name"])]
                    self.TypeData = self.TypeData + [String(describing: json["result"]["results"][i]["Type"])]
                    self.SexData = self.SexData + [String(describing: json["result"]["results"][i]["Sex"])]
                    self.ImageData = self.ImageData + [String(describing: json["result"]["results"][i]["ImageName"])]
                    if(self.NameData[i].isEmpty){
                        self.NameData[i] = "目前還沒有名字~!"
                    }
                    
                }
//                print(self.ImageData)
                self.NewTable.reloadData()

            case .failure(let error):
                print(error)
            }
        }
        

    }
    
    

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
        return self.NameData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AnimalTableViewCell
        cell.nameLabel?.text = self.NameData[indexPath.row]
        cell.typeLabel?.text = self.TypeData[indexPath.row]

        cell.sexLabel?.text = self.SexData[indexPath.row]
        
        let image_url = NSURL(string:self.ImageData[indexPath.row])
        
        let filter = AspectScaledToFillSizeCircleFilter(size: CGSize(width: 100.0, height: 100.0))

        
        cell.ImageView?.af_setImage(withURL: image_url! as URL, placeholderImage: nil, filter: filter, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)

        // Configure the cell...

        return cell
    }
    

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
