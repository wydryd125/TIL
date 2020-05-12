# TIL
## Today I Learned


## 2020.02.17 - JSONSerialization

### JSON
- Javascript 언어로부터 파생 (JavaScript Object Notation)
- 언어와 플랫폼 간 독립적이고 가벼워서 XML 방식을 대체하여 현재 거의 표준으로 사용되고 있는 데이터 교환 형식
- 두 개의 구조를 기본으로 가짐
	- 'Name : Value' 형태의 쌍을 이루는 콜렉션 타임. 각 언어에서 Hash table, Dictionary 등으로 구현
	- 값들의 순서화된 리스트, 대부분 언어들에서 Array, List 또는 Sequence	로 구현
- **XML**에 비해 구조가 단순하여 파싱이 쉽고 빠름

### JSON vs XML
- JSON
```swift
{"widget": { 
	"debug": "on",
	"window": {
		"title": "Sample Konfabulator Widget", "name": 			"main_window",
		"width": 500,
		"height": 500
},
"text": {
		"data": "Click Here",
		"size": 36,
		"style": "bold",
		"name": "text1",
		"hOffset": 250,
		"vOffset": 100,
		"alignment": "center",
		"onMouseUp": "sun1.opacity = (sun1.opacity / 100) * 90;"
	}
}}
```

- XML
```swift
<widget>
	<debug>on</debug>
	<window title="Sample Konfabulator Widget">
		<name>main_window</name> 
		<width>500</width> 
		<height>500</height>
	</window>
	<text data="Click Here" size="36" style="bold">
    <name>text1</name>
    <hOffset>250</hOffset>
    <vOffset>100</vOffset>
    <alignment>center</alignment>
    <onMouseUp>
				sun1.opacity = (sun1.opacity / 100) * 90; 
		</onMouseUp>
  </text>
</widget>
```

### JSON in Swift

```swift
let jsonString = """
{
 
	"someNumber" : 1,
	"someString" : "Hello",
	"someArray"  : [1, 2, 3, 4],
	"someDict"   : {
		"someBool" : true
	} 
}
"""
let jsonData = jsonString.data(using: .utf8)!
let jsonObject = try! JSONSerialization.jsonObject(with: jsonData)
print(jsonObject)
```

### JSONSerialization

-  JSON과 이에 상응하는 Foudation 객체 간 변환하는 객체이며 iOS 7 이후로 Thread Safety

- Data는 5가지 인코딩 지원 형식 중 하나이며, **UTF-8** 이 기본값으로 쓰이고 가장 효율적 

  	- UTF-8, UTF-16LE, UTF-16BE, UTF-32LE, UTF-32BE

- JSON으로 변환되기 위한 Foundation 객체는 다음 속성을 따라야 함

   - Top Level Object: NSArray, NSDictionary
   - 모든 객체는 NSString, NSNumber, NSArray, NSDictionary, NSNull 의 이스턴스
   -  모든 Dictionary 의 Key 는 NSSString 인스턴스
   - 숫자는 NaN 이나 무한대 값이 아니어야 함

- JSON data 로 변환 가능 여부는 **isValidJSONObject(_:)** 메서드를 통해 확인가능

