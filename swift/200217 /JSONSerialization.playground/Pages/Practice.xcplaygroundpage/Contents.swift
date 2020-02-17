//: [Previous](@previous)
import Foundation


/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
    print("------------------------11-------------------------")
    let notifyURL = "http://api.open-notify.org/iss-now.json"
    guard let url = URL(string: notifyURL) else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        guard error == nil else { return print("에러에욧") }
        guard let response = response as? HTTPURLResponse,(200..<300).contains(response.statusCode),
            response.mimeType == "application/json" else { return }
        guard let data = data else { return print("없어 데이터") }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
        if let position = jsonObject["iss_position"] as? [String: String],
        let timestamp = jsonObject["timestamp"] as? Int,
        let message = jsonObject["message"] as? String {
        print(position, timestamp, message )
        }
        
    }
    dataTask.resume()
}
//practice1()


/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
""".data(using: .utf8)!

struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
}

func practice2() {
    if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonString2) as? [String: Any] {
        print("----------------22--------------------")
        guard let user = jsonObjects["users"] as? [[String: Any]] else { return }
//        print(user)
        for json in user {
            if let id = json["id"] as? Int,
               let firstName = json["first_name"] as? String,
               let lastName = json["last_name"] as? String,
               let email = json["email"] as? String {
//                    print(id, firstName, lastName, email)
                  print(User.init(id: id, firstName: firstName, lastName: lastName, email: email))
            }
        }
    }
}

practice2()



/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
    print("------------------33------------------")
    let codeURL = "https://jsonplaceholder.typicode.com/posts"
    guard let url2 = URL(string: codeURL) else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url2) {
        (data, response, error) in
        guard error == nil else { return print("에러에욧") }
        guard let response = response as? HTTPURLResponse,(200..<300).contains(response.statusCode),
            response.mimeType == "application/json" else { return }
        guard let data = data else { return print("낫데이터") }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { return }
        
        for json in jsonObject {
            if let userId = json["userId"] as? Int,
                let id = json["id"] as? Int,
                let title = json["title"] as? String,
                let body = json["body"] as? String {
                print(Post.init(userId: userId, id: id, title: title, body: body))
            }
        }
        print(jsonObject.count)
    }
    dataTask.resume()
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


