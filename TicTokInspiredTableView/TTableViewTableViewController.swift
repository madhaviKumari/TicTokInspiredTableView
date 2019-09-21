
import UIKit
import AVFoundation
class TTableViewTableViewController: TITableViewController{

    var data = [ViewT]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
  
        print("Starting TViewController")
        
       
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("TViewController")
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
        cell?.textView.text = "ecdc d c njckjdc"
        let d = data[indexPath.row]
        let url = NSURL(string: d.videoUrl );
           let avPlayer = AVPlayer(url: url as! URL);
          
        
        print("Rendring cell")
        guard let mcell = cell else {
            fatalError("Could not found any cell for cellmidentifier")
        }
        
        mcell.textView.text = d.text
        mcell.mImageView.image = d.image
        mcell.videov.playerLayer.player = avPlayer;
        mcell.videov.playerLayer.frame = view.bounds
        mcell.videov.playerLayer.videoGravity = AVLayerVideoGravity.resize
    

        // Configure the cell...

        return mcell
    }
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let mcell = cell as? TTableViewCell else {
            fatalError("Casting error")
        }
        mcell.videov.player?.play()
        
        
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let mcell = cell as? TTableViewCell else {
            fatalError("Casting error")
        }
        mcell.videov.player?.pause()
        mcell.videov.player = nil
    }
    
    
    
    
    
    func loadData(){
        //Creation object
        let obj1 = ViewT.init(text: "This is first image", image: UIImage(named: "bg1")!,videoUrl: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")
        let obj2 = ViewT.init(text: "This is second image", image: UIImage(named: "bg2")!,videoUrl: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")
        let obj3 = ViewT.init(text: "This is thired image", image: UIImage(named: "bg3")!,videoUrl: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")
        let obj4 = ViewT.init(text: "This is fourth image", image: UIImage(named: "bg4")!,videoUrl: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8")
        data.append(obj1)
        data.append(obj2)
        data.append(obj3)
        data.append(obj4)
    }
    

}
