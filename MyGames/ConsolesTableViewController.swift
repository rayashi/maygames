//
//  ConsolesTableViewController.swift
//  MyGames
//
//  Created by Humberto Rayashi on 16/04/19.
//  Copyright © 2019 Humberto Rayashi. All rights reserved.
//

import UIKit

class ConsolesTableViewController: UITableViewController {
    
    let consolesManager = ConsolesManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConsoles()
    }
    
    func loadConsoles() {
        consolesManager.loadConsoles(with: context)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    @IBAction func addConsole(_ sender: UIBarButtonItem) {
        showConsoleAlert(with: nil)
    }
    
    func showConsoleAlert(with console: Console?) {
        let title = console == nil ? "Adicionar Console" : "Editar Console"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Nome do console"
            textField.text = console != nil ? console?.name : ""
        }
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { action in
            let console = console ?? Console(context: self.context)
            console.name = alert.textFields?.first?.text
            do {
                try self.context.save()
                self.loadConsoles()
            } catch {
                print(error.localizedDescription)
            }
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return consolesManager.consoles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = consolesManager.consoles[indexPath.row].name
        return cell
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

}
