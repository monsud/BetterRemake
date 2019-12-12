//
//  SegmentedController.swift
//  Prime Video
//
//  Created by Alessandro Barruffo on 05/12/2019.
//  Copyright © 2019 Alessandro Barruffo. All rights reserved.
//

import UIKit

@IBDesignable
class SegmentedController: UIControl {
    
    var buttons = [UIButton]()
    var selector : UIView!

    @IBInspectable
    var selectorColor : UIColor = .white {
        didSet{
            updateView()
        }
     }
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet{
             layer.borderColor = borderColor.cgColor
        }
    }
 

    @IBInspectable
    var textColor : UIColor = UIColor.white {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles : String = "" {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        
        subviews.forEach{ (view) in
            view.removeFromSuperview()
            }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
//        var selectorWidth = CGFloat(buttonTitles[0].count*10)
        var i = 0
        
        for buttonTitle in buttonTitles {
 
            let button = UIButton(type : .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:) ), for: .touchUpInside )
            
            if(i == 0)
            {
                button.setTitleColor(.white, for: .normal)
            }
            buttons.append(button)
            i = i + 1
        }
  
  let selectorWidth1 = frame.width / CGFloat(buttonTitles.count) - 33
        selector = UIView(frame: CGRect(x: 18 ,y:31,width: selectorWidth1,height: 2))

        selector.backgroundColor = selectorColor
        addSubview(selector)

        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        addSubview(sv)
        
        //with the following code I am setting the width anf the eight of the stack view wqual to the uiview that represent the segmented controller
        sv.translatesAutoresizingMaskIntoConstraints = false //beacuse I want to set my own consgtraints
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo : self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    @objc func buttonTapped(button : UIButton){
        
        for (_,btn) in buttons.enumerated() {
//            let my_color = UIColor(cgColor: CGColor(srgbRed: 80, green: 171, blue: 246, alpha: 1.00))
            //btn.setTitleColor(UIColor(displayP3Red: 0.408, green: 0.662, blue: 0.941, alpha: 1.00), for: .normal)
            btn.tintColor = .white
        }
        
        for (buttonIndex,btn) in buttons.enumerated() {
 
            if btn == button {
                
                button.setTitleColor(.white, for: .normal)
    
                //Soccer
                if(buttonIndex == 0)
                {
                    
//                    let selector1 = frame.width / CGFloat(buttons.count) - 60
                    UIView.animate(withDuration: 0.3, animations: {
                        self.selector.frame.size.width = self.frame.width / CGFloat(self.buttons.count) - 33
                        self.selector.frame.origin.x = 18
                        }
                    )
//                    self.selector.frame.origin.x = selector1
                }
                    
                    //Basket
                else if(buttonIndex == 1)
                {
                   UIView.animate(withDuration: 0.3, animations: {
                       
                       self.selector.frame.size.width = self.frame.width / CGFloat(self.buttons.count) - 25
                       self.selector.frame.origin.x = 105
                    }
                   )
                    
                }
                    //Tennis
                else if(buttonIndex == 2)
                {
                   UIView.animate(withDuration: 0.3, animations: {
                       
                       self.selector.frame.size.width = self.frame.width / CGFloat(self.buttons.count) - 30
                       self.selector.frame.origin.x = 200
                   }
                   )
                    
                }
                    //Golf
                else if(buttonIndex == 3)
                {
                   UIView.animate(withDuration: 0.3, animations: {
                       
                       self.selector.frame.size.width = self.frame.width / CGFloat(self.buttons.count) - 50
                       self.selector.frame.origin.x = 285
                   }
                   )
                    
                }
                    //Volley
                else if(buttonIndex == 4){
                        UIView.animate(withDuration: 0.3, animations: {
                                          
                            self.selector.frame.size.width = self.frame.width / CGFloat(self.buttons.count) - 35
                            self.selector.frame.origin.x = 350
                        }
                        )
                                       
                    }
                else
                {
                    let selectorStartPosition = (frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex))
                        
                    UIView.animate(withDuration: 0.3, animations: {
                            
                        self.selector.frame.origin.x = selectorStartPosition
                           
    //              let textLEnght = button.titleLabel?.text?.count
                            
    //              self.selector.frame.size.width = CGFloat(textLEnght! * 20)
                            
                    }
                    )
                }
            }
        }
        
        sendActions(for: .valueChanged)
    }
    

}
