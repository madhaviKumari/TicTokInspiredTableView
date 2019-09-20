//
//  TTableViewTableViewController.swift
//  TicTokInspiredTableView
//
//  Created by Afsar Sir on 20/09/19.
//  Copyright © 2019 Afsar Sir. All rights reserved.
//

import UIKit

class TTableViewTableViewController: UITableViewController, UIGestureRecognizerDelegate {

    var data = [ViewT]()
    var itemHeight = CGFloat()
    var currentCell = 0;
    var isScrolling = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipGes = UISwipeGestureRecognizer(target: self, action: #selector(swipup(_sender:)))
        swipGes.delegate = self
        swipGes.direction = .up
        self.tableView.addGestureRecognizer(swipGes)
        
        let swipDown = UISwipeGestureRecognizer(target: self, action: #selector(swipDown(_sender:)))
        swipDown.delegate = self
        swipDown.direction = .down
        self.tableView.addGestureRecognizer(swipDown)
        
        self.tableView.isScrollEnabled = false
        print("Starting TViewController")
        
        
        
        itemHeight = view.bounds.height
       loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellm", for: indexPath) as? TTableViewCell
        print("Rendring cell")
        guard let mcell = cell else {
            fatalError("Could not found any cell for cellmidentifier")
        }
        let d = data[indexPath.row]
        mcell.textView.text = d.text
        mcell.mImageView.image = d.image

        // Configure the cell...

        return mcell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       print("bounds is \(self.view.bounds.height)")
        
        return CGFloat(self.view.bounds.height)
    }

    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
       // print(indexPath.row)
        //self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
       /*
        //print("Scrolled )")
        let p = currentCell * Int(itemHeight)
        print("Previous item offset \(p)")
        let y = Int(scrollView.contentOffset.y)
        if p<y{
            // Scrolling to down
            let diff = y-p
            if diff>Int(itemHeight){
                //scroll to next currentCell + 1
                let indexPath = IndexPath(row: currentCell+1, section: 0)
                currentCell = currentCell + 1
                tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            }
            else {
                // Scroll to currentCell
                let indexPath = IndexPath(row: currentCell, section: 0)
                tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            }
            
            
            
        }
        else {
            
            //scrolling to up
            
            
        }
        
        
        print(scrollView.contentOffset)*/
        
        
    }
    
    
    
    func loadData(){
        
        
        
        //Creation object
        let obj1 = ViewT.init(text: "This is first image", image: UIImage(named: "bg1")!)
        let obj2 = ViewT.init(text: "This is second image", image: UIImage(named: "bg2")!)
        let obj3 = ViewT.init(text: "This is thired image", image: UIImage(named: "bg3")!)
        let obj4 = ViewT.init(text: "This is fourth image", image: UIImage(named: "bg4")!)
        data.append(obj1)
        data.append(obj2)
        data.append(obj3)
        data.append(obj4)
        
        
    }
    
    @objc func swipup(_sender: UISwipeGestureRecognizer){
        
        //print("Swiped")
        
        if _sender.direction == .up && currentCell < data.count-1{
            currentCell  = currentCell+1
            let indexPath = IndexPath(row: currentCell, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
        
    }
    
    @objc func swipDown (_sender: UISwipeGestureRecognizer){
        
        
        if _sender.direction == .down && currentCell > 0{
            
            currentCell = currentCell - 1
            let indexPath = IndexPath(row: currentCell, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            
        }
        
        
    }

}
