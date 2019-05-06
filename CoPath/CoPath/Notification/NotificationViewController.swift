//
//  NotificationViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    var index : Int = 0
    var notif : [String] = ["test1","test2","test3","test4","test5"]
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! NotifDetail
        destVC.index = index
    }

}

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notif.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifCell", for: indexPath)
        cell.textLabel?.text = notif[indexPath.row]
        if indexPath.row == 0 {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else if indexPath.row == 2 {
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else if indexPath.row == 3 {
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "NotifToDetail", sender: notif)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notif.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}