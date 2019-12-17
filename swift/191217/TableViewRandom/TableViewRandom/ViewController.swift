

import UIKit

final class ViewController: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    
    let maxNumber = 20
    var resultArr = [Int]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.frame = view.frame
        view.addSubview(tableView)
        
        random()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "(>O<)/",
            style: .plain,
            target: self,
            action: #selector(reLoadData)
        )
           
    }
    
    func random() {
        let tempArr = Array(1...(maxNumber + 50))
        resultArr.removeAll()
        for _ in 1... {
            guard let tempCount = tempArr.randomElement() else { return }
            
            if !resultArr.contains(tempCount) {
                resultArr.append(tempCount)
            }
            
            if resultArr.count == maxNumber {
                break
            
            }
        }
    }
    
    @objc func reLoadData() {
        random()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    //-> 리턴값을 보고 뷰에 보여지는 셀의 갯수를 정함.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    //-> 위에 리턴값의 갯수만큼 셀을 만들고 그 셀을 꾸며주는 곳
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = String(resultArr[indexPath.row])
        
        return cell
    }
    
    
}



