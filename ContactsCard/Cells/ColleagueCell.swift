//
//  ColleagueCell.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ColleagueCell: UITableViewCell {
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var name         : UILabel!
    @IBOutlet weak var secondName   : UILabel!
    @IBOutlet weak var patronomic   : UILabel!
    @IBOutlet weak var position     : UILabel!
    @IBOutlet weak var workPhone    : UILabel!
    weak var colleagueCellViewModel : ColleagueCellViewModel! {
        didSet {
            profilePhoto.image = colleagueCellViewModel.profilePhoto
            name.text = colleagueCellViewModel.name
            secondName.text = colleagueCellViewModel.secondName
            patronomic.text = colleagueCellViewModel.patronomic
            position.text = colleagueCellViewModel.position
            workPhone.text = colleagueCellViewModel.workPhone
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}
