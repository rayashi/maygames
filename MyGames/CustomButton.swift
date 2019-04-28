
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(named: "color-main")
        layer.cornerRadius = frame.height / 2
        
    }
}
