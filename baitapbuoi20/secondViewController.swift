//
//  secondViewController.swift
//  baitapbuoi20
//
//  Created by Toan on 4/29/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var QuaysoView: UIButton!
   
    @IBOutlet weak var SecondLabel: UILabel!{
        didSet{
            SecondLabel.text = label
        }
    }
    var number : Int! = 0
    var label : String?
    var isNumber : Bool = true
   
    var  nhanthuongTitle : Bool = false
    var  passdata :((compare) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = "Quay số may mắn"
        
    }


    @IBAction func QuayAction(_ sender: Any) {
        if isNumber == true {
            if nhanthuongTitle == true {
                popController()
            }else{
                changeTitle()
            }
           
        }
        
    }
    func  changeTitle(){
         QuaysoView.setTitle("nhan thuong", for: .normal)
        nhanthuongTitle = true
    }
    func popController(){

        let numberreturn = Int.random(in: 0...100)
         passdata?(compare(number, numberreturn))
             print(number!,numberreturn)
        self.navigationController?.popViewController(animated: true)
        
    }
 
}

