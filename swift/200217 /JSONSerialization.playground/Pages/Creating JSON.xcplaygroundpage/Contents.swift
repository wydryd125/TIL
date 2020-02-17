//: [Previous](@previous)
import Foundation
//: - - -
//: # Creating JSON Data
//: * class func isValidJSONObject(_:) -> Bool
//: * class func writeJSONObject(_:to:options:error:) -> Int
//: * class func data(withJSONObject:options:) throws -> Data
//: - - -

//: ---
//: ## Write JSON Object to OutputStream
//: ---
// Foundation 객체 -> 파일 저장

func writeJSONObjectToOutputStream() {
  let jsonObject = ["hello": "world", "foo": "bar", "iOS": "Swift"]
    // JSONSerialization - JSON과 동등한 Foundation 객체간에 변환하는 객체입니다.
    // isValidJSONObject - json으로 변환 가능한지
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
  
  let jsonFilePath = "myJsonFile.json"
    //"myJsonFile.json" 이 이름으로 된 파일이 있는지? 추가하지않겠다능..
  let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
  outputJSON.open()
  
  let writtenBytes = JSONSerialization.writeJSONObject(
    jsonObject,
    to: outputJSON,
//    options: [],
    // 내가 원하는 형식으로 저장 가능함.
    //.prettyPrinted - 좀 더 보기좋은 형식이나 writtenBytes 값이 증가 됨.
//    options: [.prettyPrinted],
    //.sortedKeys - 딕셔너리는 정렬이 되지 않는데 솔티드 옵션 쓰면 유니코드로 정렬 됨,  writtenBytes 값 그대로
    options: [.sortedKeys],
    //    options: [.prettyPrinted, .sortedKeys],
    error: nil
    )
  print(writtenBytes)  // 0 = error
  outputJSON.close()
  
  do {
    let jsonString = try String(contentsOfFile: jsonFilePath)
    print(jsonString)
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ writeJSONObjectToOutputStream ] ----------\n")
//writeJSONObjectToOutputStream()

//: ---
//: ## Data with JSON Object
//: ---
// Foundation 객체 -> JSON 형식 데이터

private func dataWithJSONObject() {
  let jsonObject: [String: Any] = [
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3],
    "someDict"   : [
      "someBool" : true
    ]
  ]
  
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
    
  do { //가능할떄
    // 딕셔너리를 데이터로 인코딩했다가 다시 데이터를 통해 딕셔너리로 변환해보는 과정
    let encoded = try JSONSerialization.data(withJSONObject: jsonObject)
    let decoded = try JSONSerialization.jsonObject(with: encoded)
    if let jsonDict = decoded as? [String: Any] {
      print(jsonDict)
    }
  } catch { //안될떄
    print(error.localizedDescription)
  }
}

print("\n---------- [ dataWithJSONObject ] ----------\n")
//dataWithJSONObject()



//: - - -
//: # Creating a JSON Object
//: * class func jsonObject(with:options:) throws -> Any
//: - - -

//: ---
//: ## JSON Object with Data
//: ---
// JSON 형식 데이터 -> Foundation 객체

private func jsonObjectWithData() {
  let jsonString =  """
  {
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3, 4],
    "someDict"   : {
      "someBool" : true
    }
  }
  """
//  let jsonString = """
//     { "hello": "world", "foo": "bar", "iOS": "Swift" }
//  """
    //위의 문자열을 데이터로 바꾸어서 저장
  let jsonData = jsonString.data(using: .utf8)!
    // 데이터를 json형식으로 저장.
  do {
    let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
    if let jsonDict = foundationObject as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ jsonObjectWithData ] ----------\n")
jsonObjectWithData()



//: ---
//: ## JSON Object with InputStream
//: ---
private func jsonObjectWithInputStream() {
  let jsonFilePath = "myJsonFile.json"
  let inputStream = InputStream(fileAtPath: jsonFilePath)!
  inputStream.open()
  defer { inputStream.close() }
  // 데이터가 있는지 확인 //hasBytesAvailable - 수신자가 읽을 수있는 바이트가 있는지 여부를 나타내는 부울 값입니다.
  guard inputStream.hasBytesAvailable else { return }
  // 데이터가 있으면 제이슨으로 변환
  do {
    let jsonObject = try JSONSerialization.jsonObject(with: inputStream)
    print(jsonObject)
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ jsonObjectWithInputStream ] ----------\n")
//jsonObjectWithInputStream()


//: [Next](@next)
