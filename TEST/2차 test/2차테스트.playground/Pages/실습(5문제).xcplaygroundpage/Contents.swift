import Foundation

/*
 < 1번 문제 >
 손님, 바리스타, 커피 클래스를 각각 정의하고
 손님이 바리스타에게 커피를 주문하는 기능 구현하기
 
 [ Class ]
 ** 손님 (Customer)
 - 필수 속성: 이름(name)
 - 필수 메서드: 주문하기( func order(menu: CoffeeMenu, to barista: Barista) )
 
 ** 바리스타 (Barista)
 - 필수 속성: 이름(name)
 - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
 
 ** 커피 (Coffee)
 - 필수 속성: 이름(name), 가격(price)
 
 [ Enumeration ]
 ** 커피 메뉴 (CoffeeMenu)
 - case: americano, latte, cappuccino
 
 e.g.
 let customer = Customer(name: "손님A")
 let barista = Barista(name: "바리스타A")
 customer.order(menu: .americano, to: barista)
 
 Output: 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
 */

print("\n---------- [ 1번 문제 ] ----------\n")

class Customer {
  let name: String
  init(name: String) {
    self.name = name
  }
  
  func order(menu: CoffeeMenu, to barista: Barista) {
    let coffee = barista.makeCoffee(menu: menu)
    print("\(name)이(가) \(barista.name)에게 \(coffee.price)원짜리 \(coffee.name)을(를) 주문하였습니다.")
  }
}

class Barista {
  let name: String
  init(name: String) {
    self.name = name
  }
  
  func makeCoffee(menu: CoffeeMenu) -> Coffee {
    let price: Int
    switch menu {
    case .americano: price = 2000
    case .latte: price = 2500
    case .cappuccino: price = 3000
    }
    return Coffee(name: menu.rawValue, price: price)
  }
}


enum CoffeeMenu: String {
  case americano = "Americano"
  case latte = "Latte"
  case cappuccino = "Cappuccino"
}

class Coffee {
  let name: String
  let price: Int
  init(name: String, price: Int) {
    self.name = name
    self.price = price
  }
}

let customer = Customer(name: "손님A")
let barista = Barista(name: "바리스타A")
customer.order(menu: .americano, to: barista)
// 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.



/*
 < 2번, 3번 문제 >
 문제를 읽고 두 가지 서로 다른 방식으로 구현해보기
 2번 문제: 아래 내용을 Dictionary를 이용해 구현하기
 3번 문제: 아래 내용을 Array를 이용해 구현하기
 
 문제:
 주어진 숫자에 대해 10의 숫자 단위로 그룹으로 묶고, 각 그룹의 데이터는 해당 범위 내의 숫자들로 구성
 
 Input 1: Array(1...100)
 Input 2: [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]
 Output:
 아래와 동일한 형식으로 출력하며, 그룹의 숫자는 오름차순으로 출력되어야 함.
 값이 하나도 없는 그룹은 제외하고 출력
 
 e.g.
 1) Input 1 일 때
 Group: 0  -  Value: [1, 2, 3, 4, 5, 6, 7, 8, 9]
 Group: 1  -  Value: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
 ....
 Group: 10  -  Value: [100]
 
 2) Input 2 일 때 - 값이 하나도 없는 그룹은 제외하고 출력
 Group: 0  -  Value: [0, 3, 9]
 ...
 Group: 4  -  Value: [41, 49]
 Group: 9  -  Value: [90, 98]
 */

let data1 = Array(1...100)
let data2 = [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]

/*
 2번. Dictionary를 이용한 형태
 */

print("\n---------- [ 2번 문제 ] ----------\n")

func sortOut(numbers: [Int]) -> [Int: [Int]] {
  var groupDict: [Int: [Int]] = [:]
  
  for i in numbers {
    if let _ = groupDict[i / 10] {
      groupDict[i / 10]?.append(i)
    } else {
      groupDict[i / 10] = [i]
    }
  }
  return groupDict
}

let groupDict = sortOut(numbers: data2)
for group in groupDict.keys.sorted() {
  print("Group: \(group)  -  Value: \(groupDict[group]!)")
}



/*
 3번. Array를 이용한 형태
 */

print("\n---------- [ 3번 문제 ] ----------\n")

func sortOutNumbers(_ numbers: [Int]) -> [[Int]] {
  var groups: [[Int]] = []
  
  for number in numbers {
    let quotient = number / 10
    let diffCount = quotient - groups.count
    
    if diffCount >= 0 {
      for _ in 0...diffCount {
        groups.append([])
      }
    }
    groups[quotient].append(number)
  }
  return groups
}


let numbers = sortOutNumbers(data2)
for (idx, group) in numbers.enumerated() {
  guard !group.isEmpty else { continue }
  print("Group: \(idx)  -  Value: \(group)")
}




/*
 < 4번 문제 >
 아래 코드가 요구조건에 맞게 동작하도록 구현
 */

print("\n---------- [ 4번 문제 ] ----------\n")


struct User {
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable  {
  let name: String
}

struct FriendList {
  var user: User
  
  mutating func addFriend(name: String) -> User {
    let friend = Friends(name: name)
    user.friends.append(friend)
    return user
  }
  
  mutating func blockFriend(name: String) -> User  {
    let friend = Friends(name: name)
    
    // Friends에 Equatable 프로토콜을 적용해야 firstIndex(of:) 사용 가능
    // Equatable 프로토콜 미적용 시 firstIndex(where:) 사용
    if let index = user.friends.firstIndex(of: friend) {
      user.friends.remove(at: index)
    }
    if !user.blocks.contains(friend) {
      user.blocks.append(friend)
    }
    return user
  }
}


var user = User()

var friendList = FriendList(user: user)
user = friendList.addFriend(name: "원빈")
user = friendList.addFriend(name: "장동건")
user = friendList.addFriend(name: "정우성")
user.friends

user = friendList.blockFriend(name: "원빈")
user.friends
user.blocks






/*
 < 5번 문제 >
 스토리보드를 이용하지 않을 때 window를 생성하는 코드 작성
 NavigationViewController를 사용하고 시작 지점은 ViewController
 
 1. iOS 13 이상 - SceneDelegate.swift 일 때
 2. iOS 12 이하 - AppDelegate.swift 일 때
 */

print("\n---------- [ 5번 문제 ] ----------\n")

import UIKit

class ViewController: UIViewController {}


// 1번
class SceneDelegate {
  var window: UIWindow?
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    let vc = ViewController()
    let naviController = UINavigationController(rootViewController: vc)
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = naviController
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
  }
}


// 2번
class AppDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let vc = ViewController()
    let naviController = UINavigationController(rootViewController: vc)
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = naviController
    window?.makeKeyAndVisible()
    return true
  }
}




/*
 수고하셨습니다!
 */



