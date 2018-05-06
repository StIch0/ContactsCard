//
//  DetailsViewController.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 06/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController {
    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var secondName : UITextField!
    @IBOutlet weak var patronomic : UITextField!
    @IBOutlet weak var birthDate : UITextField!
    @IBOutlet weak var position : UITextField!
    @IBOutlet weak var workPhone : UITextField!
    @IBOutlet weak var profilePhoto : UIImageView!
    var index : Int = 0
    var friendsViewmodel : FriendsViewModel? = FriendsViewModel(contactsManager: ContactsManager())
    var colleagueViewModel  : ColleagueViewModel = ColleagueViewModel(contactsManager: ContactsManager())
    var detailsViewModel : DetailsViewModel = DetailsViewModel()
    override func viewDidLoad() {
        self.name.text = detailsViewModel.name
        self.secondName.text = detailsViewModel.secondName
        self.patronomic.text = detailsViewModel.patronomic
        self.profilePhoto.image = detailsViewModel.profilePhoto
        self.position.text = detailsViewModel.position
        self.birthDate.text = detailsViewModel.birthDate
        self.workPhone.text = detailsViewModel.workPhone
         super.viewDidLoad()
    }
     @IBAction func saveChangies(_ sender: Any) {
 
    }
}
