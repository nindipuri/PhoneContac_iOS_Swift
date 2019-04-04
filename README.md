# PhoneContac_iOS_Swift
Fetch contact list with filter(mail, phone number) easy and quickly just with single protocol.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* Xcode 10+
* Swift 4.2+

## Usage

##Create Enum for filter

```
enum ContactsFilter {
    case none
    case mail 
    case phoneNumber 
}
```


### Adopt protocol to your viewcontrolerr to recieve list

```
class ViewController: UIViewController,PhoneContactProtocol {
  
}
```

### implement function to get list

```
 func setFilter(contacts: [ContactModel]) {
        for c in contacts {
            print(c.name)
        }
    }
```


### Call funtion

```
self.fetchContacts(filter: .phoneNumber)
```



## Authors

* **Narinder Singh** -  - [](https://github.com/nindipuri)

