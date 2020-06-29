
// 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수


func selfIntroduce(friend : String, name : String, age : Int){
    print("\(friend)!!! 안녕하세용 반가워요~ 제 이름은 \(name)이고, 나이는 \(age)살입니당. 우리 모두 화이팅!! ")
}
selfIntroduce(friend: "여러분", name: "유경", age: 28)


//정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func input(a: Int){
    if a % 2 == 0{
        return print("2의 배수가 맞다")
    }
    else{
        return print("2의 배수가 아니다.")
        
    }

    
        
    }


input(a: 54)


//정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func multiNum(a: Int, b: Int)->Int
{
    return a * b
}

print(multiNum(a: 38, b: 33))



//4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func score(a: Double, b:Double, c:Double, d:Double)->Double
{
    return(a+b+c+d)/4
}
print(score(a: 99.5, b: 100, c: 97, d: 95.5))




//점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F) - if문 switch
func score(a:Double){
    if a >= 90{
       return print("A")
    }
    else if a >= 80{
        return print("B")
    }
    else if a >= 70{
        return print("C")
    }
    else{
        return print("F")
    }
   
}
score(a: 49.5)




//가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

func average(a: Double...){
    var sum = 0.0
    for i in a{
        sum += i
    }
    let averNum = sum/Double(a.count)
    if averNum  >= 90{
        print("당신은 A 입니다 축하축하")
    }
    else if averNum >= 80{
        print("당신은 B 입니다 축하")
    }
    else if averNum >= 70{
        print("당신은 C 입니다 노력하세요")
    }
    else{
        print("당신은 F 입니다 내년에 또 봐요~")
    }

}

average(a: 50, 67, 80)














