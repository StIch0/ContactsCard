//
//  DetailsViewModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 06/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class DetailsViewModel{
    var name        : String?
    var secondName  : String?
    var patronomic  : String?
    var birthDate   : String?
    var position    : String?
    var workPhone   : String?
    var profilePhoto: UIImage?
    init (friend : FriendCardModel){
        self.name = friend.name
        self.secondName = friend.secondName
        self.patronomic = friend.patronomic
        self.birthDate  = friend.birthDate
        self.profilePhoto = friend.profilePhoto
    }
    init (colleague : ColleagueCardModel){
        self.name = colleague.name
        self.secondName = colleague.secondName
        self.patronomic = colleague.patronomic
        self.profilePhoto = colleague.profilePhoto
        self.position = colleague.position
        self.workPhone = colleague.workPhone
    }
    init(){}
}
