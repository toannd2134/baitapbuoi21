//
//  firstViewController.swift
//  baitapbuoi20
//
//  Created by Toan on 4/29/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    
    
    @IBOutlet weak var viewHistory: UITextView!
    @IBOutlet weak var ketQuaLable: UILabel!
    @IBOutlet weak var texfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = "nhập một số bất kỳ"
        viewHistory.isEditable = false
    }
    
    @IBAction func pushAction(_ sender: Any) {
        let vc = secondViewController()
        if  let input = texfield.text  {
            if let  number = Int(input){
                vc.label = "Số của bạn đã chọn là : \(number)"
                vc.number = number
                vc.passdata = {[weak self] data in
                    guard let StrongSelf = self else {
                        return
                    }
                    if let first = data.firstNumber , let second = data.seconNumber{
                        //                        print(second)
                        if first < second || first > second {
                            StrongSelf.ketQuaLable.text = "Bạn đoán sai  rồi thử lại lần sau nhé "
                        }else{
                            StrongSelf.ketQuaLable.text = "Chúc mừng ! bạn  đã đoán đúng"
                            StrongSelf.viewHistory.text += """
                            Số Đã chọn : \(String(data.firstNumber)) số đã random \(String(data.seconNumber))\n
                            
                            """
                        }
                    }
                    
                    
                    
                }
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                vc.label = "bạn nhâp không đúng xin nhập lại"
                vc.isNumber = false
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            
        }
        
    }
    
    
}
