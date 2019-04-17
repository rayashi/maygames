
import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpRelease: UIDatePicker!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var btConfirm: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
        
    }
    
    @IBAction func addEditGame(_ sender: UIButton) {
        if game == nil {
            game = Game(context: context)
            game.title = tfName.text
            game.releaseDate = dpRelease.date
            
            try! context.save()
        }
        navigationController?.popViewController(animated: true)
    }
}
