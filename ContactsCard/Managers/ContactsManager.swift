//
//  ContactsManager.swift
//  ContactsCard
//
//  Created by Pavel Burdukovskii on 03/05/2018.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ContactsManager {
    func getFriend (completion : @escaping ([FriendCardModel])->Void){
        completion(self.addFriend())
    }
    func getColleague (completion : @escaping ([ColleagueCardModel])->Void){
        completion(self.addColleague())
    }
    func addFriend()->[FriendCardModel]{
        var friendCardModel : [FriendCardModel] = Array()
        friendCardModel.append(mockFriendObject(profilePhoto: UIImage(named : "man")!, name: "Ivan", secondName: "Ivanov", patronomic: "Ivanovich", birthDate: "25.06.1996"))
        friendCardModel.append(mockFriendObject(profilePhoto: UIImage(named : "man")!, name: "Ivan", secondName: "Ivanov", patronomic: "Ivanovich", birthDate: "25.06.1996"))
        friendCardModel.append(mockFriendObject(profilePhoto: UIImage(named : "man")!, name: "Ivan", secondName: "Ivanov", patronomic: "Ivanovich", birthDate: "25.06.1996"))
        friendCardModel.append(mockFriendObject(profilePhoto: UIImage(named : "man")!, name: "Ivan", secondName: "Ivanov", patronomic: "Ivanovich", birthDate: "25.06.1996"))
        friendCardModel.append(mockFriendObject(profilePhoto: UIImage(named : "man")!, name: "Ivan", secondName: "Ivanov", patronomic: "Ivanovich", birthDate: "25.06.1996"))
        return friendCardModel
    }
    func addColleague()->[ColleagueCardModel]{
        var colleagueCardModel : [ColleagueCardModel] = Array()
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Ivanov", patronomic: "", position: "Manager", workPhone: "111-101"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-191"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-181"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        colleagueCardModel.append(mockColleagueObject(profilePhoto: UIImage(named : "man")!, name: "Petr", secondName: "Petrov", patronomic: "", position: "Developer", workPhone: "111-111"))
        return colleagueCardModel
    }
    private func mockFriendObject(profilePhoto: UIImage,name: String?, secondName: String?, patronomic: String?,birthDate : String?)->FriendCardModel{
        let friend = FriendCardModel(profilePhoto: profilePhoto, name: name,secondName: secondName, patronomic: patronomic,birthDate: birthDate)
        return friend
    }
    private func mockColleagueObject(profilePhoto: UIImage, name: String?, secondName: String?, patronomic: String?, position : String?, workPhone : String?)->ColleagueCardModel{
        let colleague = ColleagueCardModel(profilePhoto: profilePhoto, name: name, secondName: secondName, patronomic: patronomic, position: position, workPhone: workPhone)
        return colleague
    }
}
