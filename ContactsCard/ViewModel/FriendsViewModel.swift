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
    func updateData (complection : @escaping ()->Void){
        contactsManager.getFriend{
            friendArray in
            self.friendArray = friendArray
             for friendObject in friendArray {
               self.friendsCellViewModelArray.append(FriendsCellViewModel(friend: friendObject))
            }
            
        }
        complection()
    }
    func addFriend (friend : FriendCardModel){
        friendArray.append(friend)
         friendsCellViewModelArray.append(FriendsCellViewModel(friend: friend))
    }
    func numberOfFriends() -> Int {
         return friendsCellViewModelArray.count
    }
    func cellViewModel(index : Int) ->FriendsCellViewModel? {
        guard index < friendsCellViewModelArray.count  else {return nil}
        return friendsCellViewModelArray[index]
    }
    func detailsVewModel(index : Int)->DetailsViewModel {
        print(index)
        print(friendArray.count)
        self.detailsViewModel = DetailsViewModel(friend: friendArray[index])
        return self.detailsViewModel!
    }
}
