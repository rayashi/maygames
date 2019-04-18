
import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpRelease: UIDatePicker!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var btConfirm: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    
    let consolesManager = ConsolesManager.shared
    var game: Game!
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    lazy var toolBar: UIToolbar = {
        let toobar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        toobar.tintColor = UIColor(named: "color-main")
        let btnCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelSelectConsole))
        let btnOk = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneSelectConsole))
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toobar.items = [btnCancel, flex, btnOk]
        return toobar
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consolesManager.loadConsoles(with: context)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfConsole.inputAccessoryView = toolBar
        tfConsole.inputView = pickerView
    }
    
    @objc func cancelSelectConsole() {
        tfConsole.resignFirstResponder()
    }
    
    @objc func doneSelectConsole() {
        tfConsole.text = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)].name
        tfConsole.resignFirstResponder()
    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
        
    }
    
    @IBAction func addEditGame(_ sender: UIButton) {
        if game == nil {
            game = Game(context: context)
            game.title = tfName.text
            game.releaseDate = dpRelease.date
            if !tfConsole.text!.isEmpty {
                game.console = consolesManager.consoles[pickerView.selectedRow(inComponent: 0)]
            }
            
            try! context.save()
        }
        navigationController?.popViewController(animated: true)
    }
}

extension EditViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consolesManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consolesManager.consoles[row].name
    }
    
}
