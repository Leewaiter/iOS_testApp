//
//  QuestionsViewController.swift
//  QuestionsWork
//
//  Created by Lee on 2021/2/2.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var collectpoints = 0
    var num = 0
    
    var qnas = [Qna(question: UIImage(named: "bsk0001")!, answer: "劍", select: ["杖","鍋子","窩不知道"]),
                Qna(question: UIImage(named: "bsk0002")!, answer: "格鬥", select: ["劍","酒瓶","窩不知道"]),
                Qna(question: UIImage(named: "bsk0003")!, answer: "劍", select: ["杖","鞭子","窩不知道"]),
                Qna(question: UIImage(named: "bsk0004")!, answer: "杖", select: ["劍","雨傘","窩不知道"]),
                Qna(question: UIImage(named: "bsk0005")!, answer: "格鬥", select: ["樂器","杯具","窩不知道"]),
                Qna(question: UIImage(named: "bsk0006")!, answer: "樂器", select: ["格鬥","枕頭","窩不知道"]),
                Qna(question: UIImage(named: "bsk0007")!, answer: "格鬥", select: ["樂器","貓","窩不知道"]),
                Qna(question: UIImage(named: "bsk0008")!, answer: "短劍", select: ["劍","香蕉","窩不知道"]),
                Qna(question: UIImage(named: "bsk0009")!, answer: "劍", select: ["樂器","斧頭","窩不知道"]),
                Qna(question: UIImage(named: "bsk0010")!, answer: "杖", select: ["劍","球棒","窩不知道"]),
                Qna(question: UIImage(named: "bsk0011")!, answer: "短劍", select: ["槍","玉米","窩不知道"]),
                Qna(question: UIImage(named: "bsk0012")!, answer: "斧頭", select: ["劍","槍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0013")!, answer: "杖", select: ["樂器","蛋蛋","窩不知道"]),
                Qna(question: UIImage(named: "bsk0014")!, answer: "格鬥", select: ["樂器","短劍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0015")!, answer: "樂器", select: ["杖","格鬥","窩不知道"]),
                Qna(question: UIImage(named: "bsk0016")!, answer: "刀", select: ["劍","短劍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0017")!, answer: "杖", select: ["斧頭","槍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0018")!, answer: "格鬥", select: ["樂器","短劍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0019")!, answer: "劍", select: ["斧頭","杖","窩不知道"]),
                Qna(question: UIImage(named: "bsk0020")!, answer: "斧頭", select: ["樂器","劍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0021")!, answer: "短劍", select: ["樂器","加油棒","窩不知道"]),
                Qna(question: UIImage(named: "bsk0022")!, answer: "槍", select: ["劍","斧頭","窩不知道"]),
                Qna(question: UIImage(named: "bsk0023")!, answer: "杖", select: ["樂器","槍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0024")!, answer: "格鬥", select: ["短劍","棉花糖","窩不知道"]),
                Qna(question: UIImage(named: "bsk0025")!, answer: "格鬥", select: ["樂器","短劍","窩不知道"]),
                Qna(question: UIImage(named: "bsk0026")!, answer: "格鬥", select: ["杖","短見","窩不知道"])]
    
    @IBOutlet weak var qnLabel: UILabel!
    
    @IBOutlet weak var says: UITextField!
    
    @IBOutlet weak var qimage: UIImageView!
    
    @IBOutlet weak var showanswer: UIButton!

    @IBOutlet weak var s1: UIButton!
    
    @IBOutlet weak var s2: UIButton!
    
    @IBOutlet weak var s3: UIButton!
    
    @IBOutlet weak var s4: UIButton!
    @IBAction func answers(_ sender: UIButton) {
        
        let yourAnswer = sender.currentTitle!
        if  qnas[num].answer == yourAnswer {
        collectpoints += 10
            showPoints.text = String("分數：\(collectpoints)")
        }
        num += 1
        if (num > 9){
            s1.isHidden = true
            s2.isHidden = true
            s3.isHidden = true
            s4.isHidden = true
            showNext.isHidden = false
            
        }
        else{
            qimage.image = qnas[num].question
            says.text = "請問這是什麼類型的武器?"
            shuf()
            }
    }
    @IBOutlet weak var showNext: UIButton!
    @IBAction func goto(_ sender: Any) {
        performSegue(withIdentifier: "shownext", sender: nil)
    }
    @IBOutlet weak var showPoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectpoints = 0
        num = 0
        qnas = qnas.shuffled()
        qimage.image = qnas[0].question
        says.text = "請問這是什麼類型的武器?"
        shuf()
        showNext.isHidden = true
        s1.isHidden = false
        s2.isHidden = false
        s3.isHidden = false
        s4.isHidden = false
        showPoints.text = String("分數：\(collectpoints)")
    }
    
    
    func shuf(){
        qnLabel.text = "第 \(num + 1) 題"
        var allselect = [qnas[num].answer,qnas[num].select[0],qnas[num].select[1],qnas[num].select[2]]
        allselect.shuffle()
        s1.setTitle(allselect[0], for: .normal)
        s2.setTitle(allselect[1], for: .normal)
        s3.setTitle(allselect[2], for: .normal)
        s4.setTitle(allselect[3], for: .normal)
    }
    
 
   
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func showanswer(_ sender: Any) {
        says.text = qnas[num].answer
    }
    @IBAction func replay(_ sender: Any) {
        
        collectpoints = 0
        num = 0
        showPoints.text = String("分數：\(collectpoints)")
        qnas = qnas.shuffled()
        qimage.image = qnas[0].question
        says.text = "請問這是什麼類型的武器?"
        shuf()
        showNext.isHidden = true
        s1.isHidden = false
        s2.isHidden = false
        s3.isHidden = false
        s4.isHidden = false
        
    }
    
    @IBSegueAction func showScore(_ coder: NSCoder) -> ShowResultViewController? {
        let controller = ShowResultViewController(coder: coder)
        controller?.points = collectpoints
        return controller
    }
        
}
