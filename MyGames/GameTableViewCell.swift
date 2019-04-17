
import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var lbImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepare(with game: Game) {
        lbName.text = game.title
        lbConsole.text = game.console?.name ?? ""
        if let image = game.cover as? UIImage {
            lbImage.image = image
        } else {
            lbImage.image = UIImage(named: "noCover")
        }
    }

}
