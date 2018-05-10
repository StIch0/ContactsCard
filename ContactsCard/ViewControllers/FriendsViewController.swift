

import Foundation
import UIKit
import Photos
class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    private var photo  : UIImage = UIImage()
    let dataBase = DataBaseManager.shared
    var dict  : [String : Any] = Dictionary()
    let imagePicker = UIImagePickerController()
    var dateTextField : String = ""
    var friendsViewModel : FriendsViewModel? = FriendsViewModel(contactsManager: ContactsManager())
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        imagePicker.delegate = self
        title = "Список друзей"
        friendsViewModel?.updateData{
//            self.friendsViewModel?.addFriend(friend: self.dataBase.fetchFromCoreData(entityName: "FriendEntity", key: "name","secondName","patronomic","birthDate") as! FriendCardModel)
            self.tableView.reloadData()
        }
        
    }
    @objc func editDate (_ sender : UITextField){
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateTextField = dateFormatter.string(from: sender.date)
    }
    @IBAction func addFirend (sender : Any){//добавление нового друга
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
            mes.placeholder = "Введите дату рождения"
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
            let birthDate = alert.textFields![3]
            if name.text != "" && secondName.text != "" && birthDate.text != "" {
            birthDate.addTarget(self, action: #selector(self.editDate), for: .editingDidBegin)
            self.friendsViewModel?.addFriend(friend:  FriendCardModel.init(profilePhoto: self.photo, name: name.text, secondName: secondName.text, patronomic: patronomic.text, birthDate: birthDate.text))
//            self.dataBase.saveContext([name.text,secondName.text, patronomic.text,birthDate.text] as! AnyObject, entityName: "FriendEntity", key: "name","secondName","patronomic","birthDate")
                self.tableView.reloadData()
            }
            else {
                let toast = UIAlertController(title: "Заполните все поля", message: "", preferredStyle: .actionSheet)
                self.present(toast, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute:  {
                    toast.dismiss(animated: true, completion: nil)
                })
            }
            
        }
        alert.addAction(cameraAlert)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//передача выбранного контакта в DetailsViewController
        if segue.identifier == "detailsFriend"{
        let detailsViewController = segue.destination as! DetailsViewController
        let index = sender as! Int
        detailsViewController.detailsViewModel = (friendsViewModel?.detailsVewModel(index: index))!
        detailsViewController.index = index
        }
        
    }
}

extension FriendsViewController : UITableViewDelegate, UITableViewDataSource {//заполнение таблицы друзей
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FriendsCell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsCell
        cell.friendsCellViewModel = friendsViewModel?.cellViewModel(index: indexPath.row)
         return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let number = friendsViewModel?.numberOfFriends(){
            return number
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "detailsFriend", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(180)
    }
}
extension FriendsViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {//открытие галлереи и выбор фото для фото профиля
    @objc private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
             photo = pickedImage
            print("photo", photo)
        }
        
        dismiss(animated: true, completion: nil)
    }
}
