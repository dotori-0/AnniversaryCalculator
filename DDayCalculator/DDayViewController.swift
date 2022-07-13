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

        designImageviews()
        designDaysLeftLabels()

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
}
