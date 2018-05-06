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
    var photo : UIImage = UIImage()
    let imagePicker = UIImagePickerController()
     var colleagueViewModel : ColleagueViewModel? = ColleagueViewModel(contactsManager: ContactsManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        imagePicker.delegate = self
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
        let cameraAlert = UIAlertAction(title: "Выбрать фото", style: .default){
            [unowned alert] _ in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionAlert = UIAlertAction(title: "Добавить", style: .default){
            [unowned alert] _ in
            let name = alert.textFields![0]
            let secondName = alert.textFields![1]
            let patronomic = alert.textFields![2]
            let position = alert.textFields![3]
            let workPhone = alert.textFields![4]            
            self.colleagueViewModel?.addColleague(colleague: ColleagueCardModel(profilePhoto: self.photo, name: name.text, secondName: secondName.text, patronomic: patronomic.text, position: position.text, workPhone: workPhone.text))
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
extension ColleagueViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photo = pickedImage
            print("photo", photo)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

