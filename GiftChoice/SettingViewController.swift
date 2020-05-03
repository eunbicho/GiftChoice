//
//  SettingViewController.swift
//  GiftChoice
//
//  Created by DigitalMedia-2017 on 2020/05/02.
//  Copyright © 2020 DigitalMedia-2017. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet var chosenLabel: UILabel! // 선택된 피커뷰 내용 띄울 라벨
    @IBOutlet var resultLabel: UILabel! // 이름이 포함된 문장 띄울 라벨
    @IBOutlet var giftImageView: UIImageView!
    
    var chosen: String? // 선택된 피커뷰 내용 받아올 변수
    var info: String? // 만들어진 문장 받아올 변수
    var giftArray: [String] = [] // 전 뷰컨트롤러의 피커뷰에서 선택된 조건에 해당하는 배열을 받아오는 변수
    var giftResult: String = "" // 무작위로 뽑힌 선물내용 String변수 초기화
    
    // 다시 고르기 버튼을 누르면
    @IBAction func reChoose(_ sender: UIButton) {
        let random = Int(arc4random()%UInt32(giftArray.count)) // 받아온 배열에 대해 무작위 인덱스 생성
        giftResult = giftArray[random] // 받아온 배열에서 무작위로 뽑은 내용을 변수에 할당
        giftImageView.image = UIImage(named:giftResult + ".jpg") // 이미지뷰에 무작위로 뽑은 내용의 이미지 띄우기
    }
    
    // View가 로드되면
    override func viewDidLoad() {
        super.viewDidLoad()

        // Optional Binding (info에 값이 있다면, 즉 null이 아니라면 resultLabel에 그 값을 보여줌)
        if let contentString = info{
            resultLabel.text = contentString
        }
        
        // Optional Binding (chosen에 값이 있다면, 즉 null이 아니라면 chosenLabel에 그 값을 보여줌)
        if let contentString2 = chosen{
            chosenLabel.text = contentString2
        }
        
        let random = Int(arc4random()%UInt32(giftArray.count)) // 받아온 배열에 대해 무작위 인덱스 생성
        giftResult = giftArray[random] // 받아온 배열에서 무작위로 뽑은 내용을 변수에 할당
        giftImageView.image = UIImage(named:giftResult + ".jpg") // 이미지뷰에 무작위로 뽑은 내용의 이미지 띄우기
        
       
    }
    
    // 다음 화면으로 넘어가기 전 사전작업
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // InformationViewController로 가는 segue라면
        if segue.identifier == "toInformationView"{

            let destVC = segue.destination as! InformationViewController // 다음 뷰컨트롤러는 InformationViewController
            destVC.image = giftImageView.image // 다음 뷰컨트롤러 이미지뷰에 현재 뷰의 이미지뷰의 이미지 넣기
            destVC.name = giftResult // 뽑힌 선물의 이름을 다음 뷰컨트롤러로 넘기기
            destVC.title = "상품 상세보기" // 다음 뷰컨트롤러의 뷰타이틀 이름 지정
        }
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
