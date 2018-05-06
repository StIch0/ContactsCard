//
//  CardModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class CardModel {
    var profilePhoto : UIImage//фото контакта
    var name : String? // имя
    var secondName : String? //фамиля
    var patronomic: String?//отчество
    init(profilePhoto : UIImage, name: String?, secondName : String?, patronomic: String?) {
        self.name = name
        self.secondName = secondName
        self.patronomic = patronomic
        self.profilePhoto = profilePhoto
    }
}

