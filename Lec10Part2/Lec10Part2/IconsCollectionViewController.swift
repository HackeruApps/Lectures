import UIKit

protocol IconsCollectionViewControllerDelegate:class {
    func didSelectIcon(_ icon: UIImage)
}

class IconsCollectionViewController: UICollectionViewController {

    var arr = [UIImage]() //
    weak var delegate:IconsCollectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //collectionView -> FlowLayout->itemSize
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        //size(width, height) //1/3
        let padding = CGFloat(8)
        let w = view.frame.width / 3 - padding
        
        layout.itemSize = CGSize(width: w, height: w)
        layout.minimumInteritemSpacing = padding
        
        
        
        arr.append(UIImage(named: "a")!)
        arr.append(UIImage(named: "b")!)
        arr.append(UIImage(named: "c")!)
        arr.append(UIImage(named: "d")!)
        arr.append(UIImage(named: "e")!)
        arr.append(UIImage(named: "f")!)
        arr.append(UIImage(named: "g")!)
        arr.append(UIImage(named: "h")!)
        arr.append(UIImage(named: "i")!)
        arr.append(UIImage(named: "j")!)
        arr.append(UIImage(named: "k")!)
        arr.append(UIImage(named: "l")!)
        arr.append(UIImage(named: "m")!)
        arr.append(UIImage(named: "n")!)
        arr.append(UIImage(named: "o")!)
        arr.append(UIImage(named: "p")!)
        arr.append(UIImage(named: "q")!)
        arr.append(UIImage(named: "r")!)
        arr.append(UIImage(named: "s")!)
        arr.append(UIImage(named: "t")!)
        arr.append(UIImage(named: "u")!)
        arr.append(UIImage(named: "v")!)
        arr.append(UIImage(named: "w")!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconcell", for: indexPath) as! IconsCollectionViewCell
    
        // Configure the cell
        cell.iconImage.image = arr[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

     
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = arr[indexPath.item]
        delegate?.didSelectIcon(image)
    }
}
