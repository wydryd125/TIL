# TIL
## Today I Learned


## 2020.02.20 - Dependency Manager

- 외부 라이브러리를 관리하는 tool

## CocoaPods
- CocoaPods는 라이브러리의 코드만내려받은 다음 매번 빌드하기 때문에 설치 속도는 빠르지만 빌드하는 시간이 오래 걸린다.
> - [Github: ]<https://github.com/CocoaPods/CocoaPods>
> - [Page: ]<https://cocoapods.org>

- CocoaPods를 설치한 프로젝트는 기존 프로젝트 파일 대신 *xcworkspace* 로 프로젝트를 실행해야 한다.

  

### How to use

- Pod init

``` 
$ sudo gem install cocoapods
```

- Edit Podfile

```
$ pod init        
$ vi Podfile
```
```

target 'CocoaPodsExample' do 
use_frameworks!

pod 'SnapKit' // 사용할 라이브러리 작성 
end

```
- Install Library

```
$ pod repo update

$ pod install
// pod install을 이전에 한 번도 수행한 적이 없을 경우 약 5 ~ 15분 소요

$ open [ProjectName].xcworkspace
```
![스크린샷 2020-05-12 오후 8 11 04](https://user-images.githubusercontent.com/57229970/81678757-c46c8500-948c-11ea-8889-5e9aa1c0bc29.png)

## Carthage

- 최초 설치할 때 라이브러리를 빌드해 놓기 때문에 Cocoapods에 비해 라이브러리 최초 설치 및 버전 업데이트 속도는 느리지만 빌드 시간이 빠르다

> - [Github: ]<https://github.com/Carthage/Carthage>

- 라이브러리가 빌드된 상태로 오기 때문에 원래 코드를 볼 수 없다.

### How to use
- Install Carthage

```

  $ brew update							# Homebrew 버전 update
  $ brew install carthage		# Carthage 설치
  $ brew upgrade carthage		# 이미 설치된 carthage 버전 update

```
- Edit Cartfile
 ````
$ vi Cartfile  
 ````

  ```
// 사용할 라이브러리 작성

github "Alamofire/Alamofire"
github "onevcat/Kingfisher"
  ```

- Install Library
```
$ carthage update 
- 전체 업데이트

$ carthage update --platform iOS 
- iOS Platform 한정

$ carthage update Alamofire
- 여러 가지 라이브러리 중 일부만 지정하여 업데이트 할 떄  
```

### Link Binary With Libraries
- Project Settings - [Build Phase] - [Link Binary With Libraries] - [Add Files]
- Open [Carthage] - [Build] - [iOS] - [{Library Name}.framework]
<img width="1133" alt="스크린샷 2020-05-12 오후 8 24 08" src="https://user-images.githubusercontent.com/57229970/81680750-8ff9c880-948e-11ea-8d02-31fd00b3edf1.png">

### New Run Script Phase
- [Build Phase] - [New Run Script Phase]
<img width="949" alt="스크린샷 2020-05-12 오후 8 25 15" src="https://user-images.githubusercontent.com/57229970/81680821-b28be180-948e-11ea-8b57-b616d1a06747.png">

### Run Script
-  Xcode를 실행할 때 실행될 script를 작성하는 것
	- Shell Script 작성
	```
	/usr/local/bin/carthage copy-frameworks
	```

	- Add Input Files
	```
	$(SRCROOT)/Carthage/Build/iOS/{Library Name}.framework
	```
<img width="924" alt="스크린샷 2020-05-12 오후 8 25 58" src="https://user-images.githubusercontent.com/57229970/81680877-cc2d2900-948e-11ea-880b-1944d4c64fd7.png">

### openSources

> - [SnapKit: ]<https://github.com/SnapKit/SnapKit>
> - [Animated Tab Bar: ]<https://github.com/Ramotion/animated-tab-bar>
> - [Alamofire: ]<https://github.com/Alamofire/Alamofire>







```

```