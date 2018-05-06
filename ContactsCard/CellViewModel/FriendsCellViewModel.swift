//
//  FriendsCellViewModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class FriendsCellViewModel {
    var profilePhoto    : UIImage?
    var name            : String?
    var secondName      : String?
    var patronomic      : String?
    var birthDate       : String?
    required init(friend : FriendCardModel) {
        profilePhoto = friend.profilePhoto
        name = friend.name
        secondName = friend.secondName
        patronomic = friend.patronomic
        birthDate = friend.birthDate
    }
}
