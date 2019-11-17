import UIKit


// 클로저 Full Syntax <-> Optimized Syntax 변환 연습

func performClosure(param: (String) -> Int) {
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count
}) //->유꽁's pick!!

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
}) //-> 한개라서 0, 두개면 1...

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count //-> 맨 끝에 있는 것은 생략 가능함.
}

performClosure { $0.count }


// [ 도전 과제 ]
 
// 1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

// let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}
//-----------------------------------



//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}
