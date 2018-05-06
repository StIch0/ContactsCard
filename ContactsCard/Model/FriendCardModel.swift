//
//  FriendCardModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class FriendCardModel: CardModel {
    var birthDate : String?//дата рождения
    init(profilePhoto: UIImage, name: String?, secondName: String?, patronomic: String?, birthDate : String?) {
        super.init(profilePhoto: profilePhoto, name: name, secondName: secondName, patronomic: patronomic)
        self.birthDate = birthDate
    }
    public class func modelsFromArray(){
        
    }
}
