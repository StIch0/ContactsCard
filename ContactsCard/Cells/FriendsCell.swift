//
//  FriendsCell.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class FriendsCell : UITableViewCell {
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var name         : UILabel!
    @IBOutlet weak var secondName   : UILabel!
    @IBOutlet weak var patronomic   : UILabel!
    @IBOutlet weak var birthDate    : UILabel!
    weak var friendsCellViewModel : FriendsCellViewModel! {
        didSet {
            profilePhoto.image = friendsCellViewModel.profilePhoto
            name.text = friendsCellViewModel.name
            secondName.text = friendsCellViewModel.secondName
            patronomic.text = friendsCellViewModel.patronomic
            birthDate.text = friendsCellViewModel.birthDate
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}
