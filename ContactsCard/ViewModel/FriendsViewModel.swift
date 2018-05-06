//
//  FriendsViewModel.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
class FriendsViewModel {
    var contactsManager : ContactsManager!
    required init(contactsManager : ContactsManager) {
        self.contactsManager = contactsManager
    }
    private var detailsViewModel : DetailsViewModel?
    private var friendsCellViewModelArray = [FriendsCellViewModel]()
    private var friendArray = [FriendCardModel]()
    func updateData (complection : @escaping ()->Void){//обновляем данные полученых контактов
        contactsManager.getFriend{
            friendArray in
            self.friendArray = friendArray
             for friendObject in friendArray {
               self.friendsCellViewModelArray.append(FriendsCellViewModel(friend: friendObject))
            }
            
        }
        complection()
    }
    func addFriend (friend : FriendCardModel){//добаление нового контакта
        friendArray.append(friend)
         friendsCellViewModelArray.append(FriendsCellViewModel(friend: friend))
    }
    func numberOfFriends() -> Int {//получение количества имеющихся контактов-друзей
         return friendsCellViewModelArray.count
    }
    func cellViewModel(index : Int) ->FriendsCellViewModel? {//получение друга по индексу для вывода в соответсвующую ячейку
        guard index < friendsCellViewModelArray.count  else {return nil}
        return friendsCellViewModelArray[index]
    }
    func detailsVewModel(index : Int)->DetailsViewModel {//получение друга по индексу при выборе из списка
        self.detailsViewModel = DetailsViewModel(friend: friendArray[index])
        return self.detailsViewModel!
    }
}
