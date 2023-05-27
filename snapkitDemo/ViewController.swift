//
//  ViewController.swift
//  snapkitDemo
//
//  Created by Salma Ayuningtyas on 25/05/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var parentBox : UIView = {
        let box = UIView()
        box.backgroundColor = .gray
        box.layer.cornerRadius = 12
        return box
    }()
    
    private lazy var secondaryBox : UIView = {
        let box = UIView()
        box.backgroundColor = .lightGray
        box.layer.cornerRadius = 12
        return box
    }()
    
    lazy var redBox : UIView = {
        let box = UIView()
        box.backgroundColor = .red
        box.layer.cornerRadius = 12
        return box
    }()
    
    lazy var blueBox : UIView = {
       let box = UIView()
        box.backgroundColor = .blue
        box.layer.cornerRadius = 12
        return box
    }()
    
    lazy var mainStckVw : UIStackView = {
        let stckvw = UIStackView(arrangedSubviews: [redBox, blueBox])
        stckvw.axis = .vertical
        stckvw.distribution = .fillEqually
        stckvw.spacing = 25
        return stckvw
    }()
    
    let heightAndWidth : CGFloat = 310

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Example 1"
        navigationController?.navigationBar.prefersLargeTitles = true
        setText()
        setUpTheBox()
    }
    
    func setText(){
        view.backgroundColor = .white
    }
    
    func setUpTheBox(){
        view.addSubview(parentBox)
        parentBox.addSubview(secondaryBox)
        secondaryBox.addSubview(mainStckVw)
        
        parentBox.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
               }
        
        secondaryBox.snp.makeConstraints{make in
            make.width.height.equalTo(heightAndWidth)
            make.center.equalTo(self.parentBox)
            
        }
        
        mainStckVw.snp.makeConstraints{make in
            make.top.leading.equalTo(self.secondaryBox).offset(18)
            make.bottom.trailing.equalTo(self.secondaryBox).offset(-18)
        }
        
        redBox.snp.makeConstraints{make in
            make.height.width.equalTo(heightAndWidth)
        }
        
        blueBox.snp.makeConstraints{make in
            make.height.width.equalTo(heightAndWidth)
        }
    }
    

}

//FYI: THIS PROJECT WITHOUT USING STORYBOARD/USER BUILDER SO I CREATE MANUALLY UI WINDOW AND ASSING IT A ROOT VIEWCONTROLLER BCSUSE, THE SYSTEM NO LONGER LOAD UI FROM STORYBOARD
// THE STEPS WHAT I DO WHEN I DIDN'T USE A STORYBOARD
// 1. GO TO INFO.PLIST THEN SEARCH 'MAIN APPLICATION SCENE MANIFEST' AND DELETE THE MAIN STORBOARD FILE BASE NAME/STORYBOARD NAME (IOS 13 OR ABOVE)
// 2. UPDATE IN SCENE DELEGATE(THE CODES ALREADY WRITTEN) FOR IOS 13 OR ABOVE

// SOURCE : https://ioscoachfrank.com/remove-main-storyboard.html


