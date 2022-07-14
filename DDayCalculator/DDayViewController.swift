//
//  DDayViewController.swift
//  DDayCalculator
//
//  Created by SC on 2022/07/13.
//

import UIKit

class DDayViewController: UIViewController {


    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!

    @IBOutlet weak var day100Label: UILabel!
    @IBOutlet weak var day200Label: UILabel!
    @IBOutlet weak var day300Label: UILabel!
    @IBOutlet weak var day400Label: UILabel!
    var dayX00LabelArray: [UILabel] = []

    @IBOutlet weak var dateLabel0: UILabel!
    @IBOutlet weak var dateLabel1: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateLabel3: UILabel!
    var dateLabelArray: [UILabel] = []

    @IBOutlet var overlayUIViewCollection: [UIView]!
    @IBOutlet var shadowUIViewCollection: [UIView]!

    var imageViewArray: [UIImageView] = []
    var backgroundImageArray = [UIImage(named: "icecream"), UIImage(named: "macarons"), UIImage(named: "doughnut"), UIImage(named: "cake")]

    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        datePicker.preferredDatePickerStyle = .inline
        setDatePickerStyle()

        imageViewArray = [imageView0, imageView1, imageView2, imageView3]
        dayX00LabelArray = [day100Label, day200Label, day300Label, day400Label]
        dateLabelArray = [dateLabel0, dateLabel1, dateLabel2, dateLabel3]

        designImageviews()
        designDaysLeftLabels()
        designDateLabels()

//        testView.layer.shadowColor = UIColor.black.cgColor
//        testView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        testView.layer.shadowRadius = 50
//        testView.layer.shadowOpacity = 1.0

    }

    func setDatePickerStyle() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else if #available(*, iOS 14.0) {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    

    func designImageviews() {
        for i in 0..<imageViewArray.count {
            imageViewArray[i].contentMode = .scaleAspectFill
            imageViewArray[i].image = backgroundImageArray[i]
            imageViewArray[i].layer.cornerRadius = 10
//            imageViewArray[i].layer.shadowColor = UIColor.black.cgColor
//            imageViewArray[i].layer.shadowOffset = CGSize(width: 0, height: 0)
//            imageViewArray[i].layer.shadowRadius = 50
//            imageViewArray[i].layer.shadowOpacity = 1.0
//            imageViewArray[i].layer.masksToBounds = false  // cornerRadius 적용 해제
//            imageViewArray[i].clipsToBounds = false    // cornerRadius 적용 해제

            overlayUIViewCollection[i].backgroundColor = .black
            overlayUIViewCollection[i].alpha = 0.2
            overlayUIViewCollection[i].layer.cornerRadius = 10

            shadowUIViewCollection[i].layer.shadowColor = UIColor.black.cgColor
            shadowUIViewCollection[i].layer.shadowOffset = CGSize(width: 0, height: 0)
            shadowUIViewCollection[i].layer.shadowRadius = 50
            shadowUIViewCollection[i].layer.shadowOpacity = 0.5
//            shadowUIViewCollection[i].layer.masksToBounds = true
        }
    }

    func designDaysLeftLabels() {
        var hundreds = 1

        for daysLeftLabel in dayX00LabelArray {
            daysLeftLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
            daysLeftLabel.textColor = .white

            daysLeftLabel.text = "D+\(hundreds)00"

            hundreds += 1
        }

//        day100Label.text = "D+100"
//        day200Label.text = "D+200"
//        day300Label.text = "D+300"
//        day400Label.text = "D+400"
    }

    func designDateLabels() {
        for dateLabel in dateLabelArray {
            dateLabel.text = nil
            dateLabel.textColor = .white
            dateLabel.textAlignment = .center
            dateLabel.numberOfLines = 0
        }
    }

    func updateDateLabel(day100: String, day200: String, day300: String, day400: String) {
        dateLabel0.text = day100
        dateLabel1.text = day200
        dateLabel2.text = day300
        dateLabel3.text = day400
    }


    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
//        type(of: sender.datePickerStyle)
        print(type(of: sender.date))


//        let word = "3월 2일, 19년"
//        let dateResult = format0.date(from: word)
//        print(dateResult)

        let formatter = DateFormatter()  // DateFormatter가 클래스이기 때문에 let으로 만들어도 수정 가능
//        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm:ss"  // Locale 없이도 KST로 변환됨
//        print("string변환: \(formatter.string(from: sender.date))")

        let day100 = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)!
        let day200 = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)!
        let day300 = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)!
        let day400 = Calendar.current.date(byAdding: .day, value: 400, to: sender.date)!

        print(day100)
        print(day200)
        print(day300)
        print(day400)

//        formatter.locale = Locale(identifier: "ko-KR")
//        formatter.dateStyle = .full
//        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy년\n MM월 dd일"
//        formatter.timeStyle = .full
        let result = formatter.string(from: sender.date)
        print("result: \(result)")

        let day100formatted = formatter.string(from: day100)
        let day200formatted = formatter.string(from: day200)
        let day300formatted = formatter.string(from: day300)
        let day400formatted = formatter.string(from: day400)


        updateDateLabel(day100: day100formatted, day200: day200formatted, day300: day300formatted, day400: day400formatted)






        // 날짜 계산
        // D-day 계산
        let daysLeft = Calendar.current.dateComponents([.day, .hour, .minute], from: Date(), to: sender.date)
//        var daysLeft = Calendar.current.dateComponents([.day, .hour], from: Date(), to: sender.date).day
        // .day는 Optional<Int>
        print("Date(): \(Date())")
        print("sender.date: \(sender.date)")
        print("🥚 기존   daysLeft: \(daysLeft)")
//        print(type(of: daysLeft))
        // sender.date의 날짜는 클릭할 때마다 선택한 날짜가 들어오지만,
        // sender.date의 시간은 빌드한 시간으로 고정된다.
        // 미래 날짜를 골랐을 경우에는, 예를 들어 내일 날짜를 골랐을 경우, 1일 뒤가 아니라 0일 23시간 59분 뒤 이런 식으로 날짜 간격이 잡힌다.
        // 따라서 내일을 고르면 day의 값은 0으로 잡힌다.
        // 반면 과거 날짜를 골랐을 경우에는, 예를 들어 어제 날짜를 골랐을 경우, 1일 전이 아니라 1일 0시간 1분 전 이런 식으로 날짜 간격이 잡힌다.
        // 따라서 어제를 고르면 day의 값은 -1로 잡힌다.
        // 날짜만이 아니라 24시간을 기준으로 day의 값이 잡히는 것이다.(24시간이 넘었는지를 본다)
        // 따라서 오늘은 D-0, 내일은 D-1, 어제는 D+1로 표시하려면,
        // 미래 날짜를 골랐을 경우 day의 값에 1을 더해야 한다.

//        if daysLeft! <= 0 {
//            daysLeft! += 1
//        }
        // 오늘을 골라도 day가 0이고 내일을 골라도 day는 0이다.
        // 시간을 기준으로 조건 처리를 해야 하는데, sender.date의 시간은 날짜를 고른 시간이 아니라 빌드한 시간으로 고정되기 때문에
        // 10 시간 동안 앱을 켜 놓을 경우
        // 다음날을 고르면 13 시간 XX 분 뒤,
        // 당일을 고르면 10 시간 XX 분 뒤 이런 식으로 계산이 될 것이다.
        // 1 시간 동안 앱을 켜 놓을 경우
        // 다음날을 고르면 22 시간 XX 분 뒤,
        // 당일을 고르면 1시간 XX분 뒤 이런 식으로 계산이 될 것이다.

        // 앱을 1 시간만 켜 놓아도, 시간 기준으로 조건 처리 시 23시간을 기준으로 조건처리를 할 경우
        // 당일을 고르면 1일 뒤로 처리되어 오류가 발생하기 때문에
        // 공평(?)하게 12시간을 기준으로 처리한다.

        print("🐣 변환 후 daysLeft: \(daysLeft)")


    }
}
