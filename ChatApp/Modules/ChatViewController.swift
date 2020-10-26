//
//  ChatViewController.swift
//  ChatApp
//
//  Created by apple on 23/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var chatTblvw: UITableView!
    let chatCellIdentifier = "Cell"
    var filterSt = "no"
    let urgentMessageView = UINibCreation.loadUrgentMessageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTblvw.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: chatCellIdentifier)
        
        // Do any additional setup after loading the view.
    }
    func openNewUrgentMessage()
    {
        urgentMessageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        urgentMessageView.tblvw.delegate = self
        urgentMessageView.tblvw.dataSource = self
       // urgentMessageView.cross_btn
        self.view.addSubview(urgentMessageView)
    }
    @IBAction func filterAction(_ sender: Any)
    {
        filterSt = "yes"
        chatTblvw.reloadData()
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
extension ChatViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == chatTblvw
        {
            
        return StaticArrays.nameArr.count
        }
        else if tableView == urgentMessageView.tblvw
        {
            return StaticArrays.urgentNameArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == chatTblvw
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatCellIdentifier, for: indexPath) as! ChatCell
            if filterSt == "no"
            {
        cell.name_lbl.text = StaticArrays.nameArr[indexPath.row]
        cell.message_lbl.text = StaticArrays.messageArr[indexPath.row]
        cell.time_lbl.text = StaticArrays.timeArr[indexPath.row]
        if indexPath.row == 1
        {
            cell.countBackgroundView.isHidden = false
            cell.count_lbl.text = "20"
            cell.backView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1.00)
            
        }
        else if indexPath.row == 4
        {
            cell.countBackgroundView.isHidden = false
            cell.count_lbl.text = "5"
            cell.backView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1.00)
        }
        else
        {
            cell.countBackgroundView.isHidden = true
            cell.backView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
           // cell.count_lbl.text = "20"
        }
        cell.imgvw.image = StaticArrays.imageArr[indexPath.row]
        return cell
            }
            else
            {
                cell.name_lbl.text = StaticArrays.nameArr[indexPath.row]
                cell.message_lbl.text = StaticArrays.messageArr[indexPath.row]
                cell.time_lbl.text = StaticArrays.timeArr[indexPath.row]
                if indexPath.row == 1
                {
                    cell.countBackgroundView.isHidden = false
                    cell.count_lbl.text = "20"
                    cell.backView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1.00)
                    
                }
                else if indexPath.row == 4
                {
                    cell.countBackgroundView.isHidden = false
                    cell.count_lbl.text = "5"
                    cell.backView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.98, alpha: 1.00)
                }
                else
                {
                    cell.countBackgroundView.isHidden = true
                    cell.backView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
                   // cell.count_lbl.text = "20"
                }
                cell.imgvw.image = StaticArrays.imageArr[indexPath.row]
                return cell
            }
        }
        else if tableView == urgentMessageView.tblvw
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: chatCellIdentifier, for: indexPath) as! UrgentMessageCell
            
            cell.name_lbl.text = StaticArrays.urgentNameArr[indexPath.row]
            cell.message_lbl.text = StaticArrays.urgentMessageArr[indexPath.row]
            cell.imgvw.image = StaticArrays.urgentImageArr[indexPath.row]
            
            return cell
           
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessageVC") as! MessageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
