//
//  ViewController.swift
//  PhoneContact
//
//  Created by Narinder Singh on 03/04/19.
//  Copyright © 2019 Narinder Singh. All rights reserved.
//

import UIKit
import Foundation
import ContactsUI

enum ContactsFilter {
    case none
    case mail
    case phoneNumber
}


class ViewController: UIViewController,PhoneContactProtocol {
   
    func setFilter(contacts: [ContactModel]) {
        for c in contacts {
            print(c.name)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.fetchContacts(filter: .phoneNumber)
        
    }

//    func phoneNumberWithContryCode() -> [String] {
//
//        let contacts = PhoneContacts.getContacts() // here calling the getContacts methods
//        var arrPhoneNumbers = [String]()
//        for contact in contacts {
//            for ContctNumVar: CNLabeledValue in contact.phoneNumbers {
//                if let fulMobNumVar  = ContctNumVar.value as? CNPhoneNumber {
//                    //let countryCode = fulMobNumVar.value(forKey: "countryCode") get country code
//                    if let MccNamVar = fulMobNumVar.value(forKey: "digits") as? String {
//                        arrPhoneNumbers.append(MccNamVar)
//                    }
//                }
//            }
//        }
//        return arrPhoneNumbers // here array has all contact numbers.
//    }
    
    
    

}





