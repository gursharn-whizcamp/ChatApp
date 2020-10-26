//
//  MessageVC.swift
//  ChatApp
//
//  Created by apple on 26/10/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MessageVC: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var tblvw: UITableView!
    var messages = [Message]()
    @IBOutlet weak var message_txtvw: UITextView!
    let textViewMaxHeight: CGFloat = 40
    @IBOutlet weak var txMessageHeight: NSLayoutConstraint!
    @IBOutlet weak var txtBackViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvw.rowHeight = UITableView.automaticDimension
      
        tblvw.register(UINib(nibName: "RightCell", bundle: nil), forCellReuseIdentifier: "RightCell")
        tblvw.register(UINib(nibName: "LeftCell", bundle: nil), forCellReuseIdentifier: "LeftCell")
        fetchData()
        setupLongPressGesture()
        // Do any additional setup after loading the view.
    }
    func fetchData() {
        messages = MessageStore.getAll()
        tblvw.reloadData()
        scrollToBottom()
    }
    func setupLongPressGesture() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.tblvw.addGestureRecognizer(longPressGesture)
    }

    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: self.tblvw)
            if let indexPath = tblvw.indexPathForRow(at: touchPoint) {
                print("press")
            }
        }
    }
    @IBAction func back(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func send(_ sender: Any)
    {
      //  Message[messages.count]
        messages[messages.count - 1].text = message_txtvw.text!
        messages[messages.count - 1].side = .right
        let ms = messages[messages.count - 1]
        messages.append(ms)
        tblvw.reloadData()
        scrollToBottom()
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
extension MessageVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return messages.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let message = messages[indexPath.row]
           if message.side == .left {
               let cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell") as! LeftCell
            cell.left_lbl.text = message.text
            cell.left_view.roundCorners(corners: [.topRight,.bottomLeft,.bottomRight], radius: 20.0)
              // cell.configureCell(message: message)
               return cell
           }
           else {
               let cell = tableView.dequeueReusableCell(withIdentifier: "RightCell") as! RightCell
            cell.right_lbl.text = message.text
            cell.right_view.roundCorners(corners: [.topLeft,.bottomLeft,.bottomRight], radius: 20.0)
               //cell.configureCell(message: message)
               return cell
           }
       }
    func scrollToBottom()  {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.tblvw.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
extension MessageVC: UITextViewDelegate
{
     func textViewDidChange(_ textView: UITextView)
    {
//        let fixedWidth = textView.frame.size.width
//        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        
        if textView.contentSize.height >= self.textViewMaxHeight
        {
            textView.isScrollEnabled = true
            txMessageHeight.constant = textView.contentSize.height
            txtBackViewHeight.constant = textView.contentSize.height + 20
        }
        else
            {
            textView.frame.size.height = textView.contentSize.height
                textView.isScrollEnabled = false
        }
        scrollToBottom()
    }
}
