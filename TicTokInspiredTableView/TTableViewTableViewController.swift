
import UIKit

class TTableViewTableViewController: TITableViewController{

    var data = [ViewT]()

    override func viewDidLoad() {
        super.viewDidLoad()
  
        print("Starting TViewController")
        
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
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
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
    

}
