//
//  PhoneContact.swift
//  PhoneContact
//
//  Created by Narinder Singh on 03/04/19.
//  Copyright © 2019 Narinder Singh. All rights reserved.
//

import Foundation
import Foundation
import ContactsUI

protocol PhoneContactProtocol {
    
    func setFilter(contacts: [ContactModel])
}

extension PhoneContactProtocol {
    
    fileprivate func getContacts(filter: ContactsFilter = .none) -> [CNContact] {
        
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            //            Debug.Log(message: "Error fetching containers") // you can use print()
        }
        
        var results: [CNContact] = []
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                //                Debug.Log(message: "Error fetching containers")
            }
        }
        return results
    }
    
    
    
    func fetchContacts(filter: ContactsFilter)  {
        var phoneContacts = [ContactModel]() // array of PhoneContact(It is model find it below)

        phoneContacts.removeAll()
        var allContacts = [ContactModel]()
        for contact in self.getContacts(filter: filter) {
            allContacts.append(ContactModel(contact: contact))
        }
        
        var filterdArray = [ContactModel]()
        if filter == .mail {
            filterdArray = allContacts.filter({ $0.email.count > 0 }) // getting all email
        } else if filter == .phoneNumber {
            filterdArray = allContacts.filter({ $0.phoneNumber.count > 0 })
        } else {
            filterdArray = allContacts
        }
        phoneContacts.append(contentsOf: filterdArray)
        setFilter(contacts: phoneContacts)
        
    }
}

