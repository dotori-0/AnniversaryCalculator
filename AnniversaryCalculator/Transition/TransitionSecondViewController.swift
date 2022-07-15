//
//  TransitionSecondViewController.swift
//  AnniversaryCalculator
//
//  Created by SC on 2022/07/15.
//

import UIKit

enum UserDefaultsKeys: String {
    case happyEmotion
}

class TransitionSecondViewController: UIViewController {


    @IBOutlet weak var textView: UITextView!
    /*
     1. 앱을 켜면 데이터를 가지고 와서 텍스트 뷰에 보여 주어야 한다.
     2. 바뀐 데이터를 저장해 주어야 한다.
        => UserDefaults
     */

    // 감정 갯수 영구적으로 저장하기!! (5 분)
    @IBOutlet weak var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("TransitionSecondViewController", #function)  // function 이름 출력

        if UserDefaults.standard.string(forKey: "nickname") != nil {
            // 가져 오기
            textView.text = UserDefaults.standard.string(forKey: "nickname")
        } else {
            // 데이터가 없는 경우에 사용할 문구
            textView.text = "고래밥"
        }

        print(UserDefaults.standard.string(forKey: "phoneNumber"))
        print(UserDefaults.standard.integer(forKey: "age"))
        print(UserDefaults.standard.bool(forKey: "inApp"))


//        if UserDefaults.standard.integer(forKey: "emotionCount") != 0 {
//            countLabel.text = #\(UserDefaults.standard.integer(forKey: "emotionCount"))#
//
//        }   else {
//            countLabel.text =
//        }

        countLabel.text = #"\#(UserDefaults.standard.integer(forKey: "emotionCount"))"#




    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TransitionSecondViewController", #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TransitionSecondViewController", #function)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("TransitionSecondViewController", #function)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("TransitionSecondViewController", #function)
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(textView.text, forKey: "nickname")
        print("저장되었습니다!")
    }

    @IBAction func emotionButtonClicked(_ sender: UIButton) {

        var currentCount = UserDefaults.standard.integer(forKey: "emotionCount")
        currentCount += 1
        UserDefaults.standard.set(currentCount, forKey: "emotionCount")
        countLabel.text = #"\#(UserDefaults.standard.integer(forKey: "emotionCount"))"#




        // 수업
        // 기존 데이터 값 가져오기
//        let currentValue = UserDefaults.standard.integer(forKey: "happyEmotion")
        let currentValue = UserDefaults.standard.integer(forKey: UserDefaultsKeys.happyEmotion.rawValue)

        // 감정 +1
        let updateValue = currentValue + 1

        // 새로운 값 저장
        UserDefaults.standard.set(updateValue, forKey: "happyEmotion")

        // 레이블에 새로운 내용 보여주기
//        countLabel.text = "\(UserDefaults.standard.integer(forKey: "happyEmotion"))"
        countLabel.text = #"\#(UserDefaults.standard.integer(forKey: "emotionCount"))"#

//        UserDefaults.standard.removeObject(forKey: <#T##String#>)  // 삭제 가능
    }

}
