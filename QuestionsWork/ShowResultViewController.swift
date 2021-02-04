//
//  ShowResultViewController.swift
//  QuestionsWork
//
//  Created by Lee on 2021/2/2.
//

import UIKit

class ShowResultViewController: UIViewController {
    var points = 0
    
    @IBOutlet weak var meme: UIImageView!
    @IBOutlet weak var showpoint: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        meme.isHidden = true
        if points == 0{
            showpoint.font = showpoint.font.withSize(24)
            showpoint.text = String("窩真的不知道")
            meme.isHidden = false
        }else{
            showpoint.font = showpoint.font.withSize(84)
            showpoint.text = String("\(points)")
        }
    }
}
