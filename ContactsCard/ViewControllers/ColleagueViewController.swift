//
//  ColleagueViewController.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ColleagueViewController:  UIViewController{
    @IBOutlet weak var tableView : UITableView!
     var colleagueViewModel : ColleagueViewModel? = ColleagueViewModel(contactsManager: ContactsManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        colleagueViewModel?.updateData{
            self.tableView.reloadData()
        }
        title = "Список коллег"
     }
    @IBAction func addColleague (sender : Any){
        let alert = UIAlertController(title: "Заполните поля", message: "" , preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {
            mes in
            mes.placeholder = "Введите имя"
        })
        alert.addTextField(configurationHandler: {
            mes in
            mes.placeholder = "Введите фамилию"
        })
        alert.addTextField(configurationHandler: {
            mes in
            mes.placeholder = "Введите отчество"
        })
        alert.addTextField(configurationHandler: {
            mes in
            mes.placeholder = "Введите должность"
        })
        alert.addTextField(configurationHandler: {
            mes in
            mes.placeholder = "Введите номер телефона"
            mes.keyboardType = .numberPad
        })
        
        let actionAlert = UIAlertAction(title: "OK", style: .default){
            [unowned alert] _ in
            let name = alert.textFields![0]
            let secondName = alert.textFields![1]
            let patronomic = alert.textFields![2]
            let position = alert.textFields![3]
            let workPhone = alert.textFields![4]

            //to do somethink with answer
            
                 self.colleagueViewModel?.addColleague(colleague: ColleagueCardModel(profilePhoto: UIImage(), name: name.text, secondName: secondName.text, patronomic: patronomic.text, position: position.text, workPhone: workPhone.text))
                self.tableView.reloadData()
 
         }
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination as! DetailsViewController
        let index = sender as! Int
        detailsViewController.detailsViewModel = (colleagueViewModel?.detailsVewModel(index: index))!
    }
}
extension ColleagueViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ColleagueCell = tableView.dequeueReusableCell(withIdentifier: "colleagueCell", for: indexPath) as! ColleagueCell
        cell.colleagueCellViewModel = colleagueViewModel?.cellViewModel(index: indexPath.row)
         return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = colleagueViewModel?.numberOfColleague(){
            return number
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "colleagueDetails", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(180)
    }
}
