//
//  ColleagueCellViewModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ColleagueCellViewModel {
    var profilePhoto    : UIImage?
    var name            : String?
    var secondName      : String?
    var patronomic      : String?
    var position        : String?
    var workPhone       : String?
    required init(colleague : ColleagueCardModel) {
        profilePhoto = colleague.profilePhoto
        name = colleague.name
        secondName = colleague.secondName
        patronomic = colleague.patronomic
        position = colleague.position
        workPhone = colleague.workPhone
     }
}
