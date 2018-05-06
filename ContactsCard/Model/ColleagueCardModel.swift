//
//  ColleagueCardModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ColleagueCardModel: CardModel {
    var position : String?//должность
    var workPhone : String?//рабочий телефон
    init(profilePhoto: UIImage, name: String?, secondName: String?, patronomic: String?, position : String?, workPhone : String?) {
       super.init(profilePhoto: profilePhoto, name: name, secondName: secondName, patronomic: patronomic)
        self.position = position
        self.workPhone = workPhone
    }
}
