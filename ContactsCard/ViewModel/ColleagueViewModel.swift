//
//  ColleagueViewModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
class ColleagueViewModel {
    var contactsManager : ContactsManager!
    required init(contactsManager : ContactsManager) {
        self.contactsManager = contactsManager
    }
    private var detailsViewModel : DetailsViewModel?
    private var colleagueCellViewModelArray = [ColleagueCellViewModel]()
    private var colleagueArray = [ColleagueCardModel]()
    func updateData (complection : @escaping ()->Void){
        contactsManager.getColleague{
            colleagueArray in
            self.colleagueArray = colleagueArray
            for colleagueObject in colleagueArray {
                self.colleagueCellViewModelArray.append(ColleagueCellViewModel(colleague: colleagueObject))
            }
        }
        complection()
    }
    func addColleague (colleague : ColleagueCardModel){
        colleagueArray.append(colleague)
        colleagueCellViewModelArray.append(ColleagueCellViewModel(colleague: colleague))
    }
    func numberOfColleague() -> Int {
        return colleagueCellViewModelArray.count
    }
    func cellViewModel(index : Int) ->ColleagueCellViewModel? {
        guard index < colleagueCellViewModelArray.count  else {return nil}
        return colleagueCellViewModelArray[index]
    }
    func detailsVewModel(index : Int)->DetailsViewModel {
        self.detailsViewModel = DetailsViewModel(colleague: colleagueArray[index])
        return self.detailsViewModel!
    }
}
