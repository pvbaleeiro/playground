import UIKit

// MARK: Swift 4.2 features
/* Case iterable
 Fornece um array para os casos do enum
 */
enum Makes: CaseIterable {
    case ford, fiat, honda, ferrari
}

for make in Makes.allCases {
    print("Available make: \(make)")
}


@dynamicMemberLookup
struct Person {
    subscript(dynamicMember member: String) -> String {
        let properties = ["language": "Objective-C", "owner": "Apple"]
        return properties[member, default: ""]
    }
    
    subscript(dynamicMember member: String) -> Int {
        let properties = ["age": 26, "height": 178]
        return properties[member, default: 0]
    }
}

let person = Person()
//print("Language = \(person.linguagem)")
//print("Owner = \(person.proprietario)")
//print("Release date = \(person.releaseDate)")

let age: Int = person.age
print("Age = \(age)")

@dynamicMemberLookup
struct User {
    subscript(dynamicMember member: String) -> (_ input: String) -> Void {
        return {
            print("Hello! I live at the address \($0).")
        }
    }
}

let user = User()
user.printAddress("555 Taylor Swift Avenue")

struct Singer {
    public var name = "Justin Bieber"
    
    subscript(dynamicMember member: String) -> String {
        return "Taylor Swift"
    }
}

let singer = Singer()
print(singer.name)

