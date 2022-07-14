//
//  SearchViewController.swift
//  DDayCalculator
//
//  Created by SC on 2022/07/14.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // DateFormatter: 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()  // DateFormatter가 클래스이기 때문에 let으로 만들어도 수정 가능
        format.dateFormat = "M월 d일, yy년"

        let result = format.string(from: Date())
        print(result, Date())

        let word = "3월 2일, 19년"
        let dateResult = format.date(from: word)
        print(dateResult)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
