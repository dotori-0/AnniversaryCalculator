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

    @IBOutlet weak var daysLeftLabel0: UILabel!
    @IBOutlet weak var daysLeftLabel1: UILabel!
    @IBOutlet weak var daysLeftLabel2: UILabel!
    @IBOutlet weak var daysLeftLabel3: UILabel!
    var daysLeftLabelArray: [UILabel] = []

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
        daysLeftLabelArray = [daysLeftLabel0, daysLeftLabel1, daysLeftLabel2, daysLeftLabel3]
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
        for daysLeftLabel in daysLeftLabelArray {
            daysLeftLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
            daysLeftLabel.textColor = .white
        }

        daysLeftLabel0.text = "D-100"
        daysLeftLabel1.text = "D-200"
        daysLeftLabel2.text = "D-300"
        daysLeftLabel3.text = "D-400"
    }

    func designDateLabels() {
        for dateLabel in dateLabelArray {
            dateLabel.textColor = .white
            dateLabel.textAlignment = .center
            dateLabel.numberOfLines = 0
        }
    }

    func updateDateLabel(dateString: String) {

        dateLabel0.text = dateString
    }


    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
//        type(of: sender.datePickerStyle)
        print(type(of: sender.date))

        // DateFormatter: 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format0 = DateFormatter()  // DateFormatter가 클래스이기 때문에 let으로 만들어도 수정 가능
        format0.dateFormat = "M월 d일, yy년"

//        let result0 = format0.string(from: Date())
//        print(result0, Date())

        let word = "3월 2일, 19년"
        let dateResult = format0.date(from: word)
//        print(dateResult)

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
//        formatter.dateStyle = .full
//        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy년\n MM월 dd일"
//        formatter.timeStyle = .full
        let result = formatter.string(from: sender.date)
        print("result: \(result)")

        updateDateLabel(dateString: result)


    }
}
