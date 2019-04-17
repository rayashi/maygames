
import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpRelease: UIDatePicker!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var btConfirm: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
        
    }
    
}
