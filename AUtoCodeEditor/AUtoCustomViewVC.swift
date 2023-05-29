//
//  AUtoCustomViewVC.swift
//  AUtoCodeEditor
//
//  Created by Joe on 2023/5/29.
//

import UIKit
import SnapKit

class AUtoCustomViewVC: UIViewController {

    let previewView = UIView()
    let contentScrollV = UIScrollView()
    
    //
    let nameBgV = UIView()
    let nameTextField = UITextField()
    
    //
    let bgColorBgV = UIView()
    let bgColorField = UITextField()
    let bgColorWell = UIColorWell()
    //
    let borderColorBgV = UIView()
    let borderColorField = UITextField()
    let borderColorWell = UIColorWell()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
        setupNameBgV()
        setupBackgroundColorV()
        setupBorderColorV()
        
    }
    

    func setupContent() {
        view.backgroundColor = ColorTool.ColorF0F0F0.color()
        view.clipsToBounds = true
        //
        let topbackBtn = UIButton()
        view.addSubview(topbackBtn)
        topbackBtn.setTitle("Back", for: .normal)
        topbackBtn.setTitleColor(.black, for: .normal)
        topbackBtn.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.width.equalTo(44)
            $0.height.greaterThanOrEqualTo(44)
        }
        topbackBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        //
        let topMakeBtn = UIButton()
        view.addSubview(topMakeBtn)
        topMakeBtn.setTitle("Make", for: .normal)
        topMakeBtn.setTitleColor(.black, for: .normal)
        topMakeBtn.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.width.equalTo(44)
            $0.height.greaterThanOrEqualTo(44)
        }
        topMakeBtn.addTarget(self, action: #selector(topMakeBtnClick), for: .touchUpInside)
        //
        
        view.addSubview(previewView)
        previewView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(topbackBtn.snp.centerY)
            $0.width.equalTo(70)
            $0.height.equalTo(44)
        }
        
        //
        
        view.addSubview(contentScrollV)
        contentScrollV.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(topbackBtn.snp.bottom).offset(20)
        }
        contentScrollV.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 900)
        contentScrollV.backgroundColor = ColorTool.ColorF0F0F0.color()
        
    }

    
}

extension AUtoCustomViewVC {
    func setupNameBgV() {

        nameBgV.backgroundColor = .white
        nameBgV.layer.cornerRadius = 8
        contentScrollV.addSubview(nameBgV)
        nameBgV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(70)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(20)
        }
        //
        let nameTitleLabel = UILabel()
        nameBgV.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(5)
            $0.width.greaterThanOrEqualTo(20)
            $0.height.equalTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 16)
        nameTitleLabel.text = "Name"
        
        //
        nameTextField.backgroundColor = ColorTool.ColorD9D9D9.color()
        nameBgV.addSubview(nameTextField)
        nameTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(5)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(-40)
        }
        nameTextField.textColor = UIColor.black
        nameTextField.addPaddingLeft(10)
        //
        let nameRandomBtn = UIButton()
        nameRandomBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
        nameBgV.addSubview(nameRandomBtn)
        nameRandomBtn.snp.makeConstraints {
            $0.centerY.equalTo(nameTextField.snp.centerY)
            $0.right.equalToSuperview().offset(-5)
            $0.width.height.equalTo(30)
        }
        nameRandomBtn.setTitle("R", for: .normal)
        nameRandomBtn.addTarget(self, action: #selector(nameRandomBtnClick), for: .touchUpInside)
    }
    
    //
    func setupBackgroundColorV() {
        
        bgColorBgV.backgroundColor = .white
        bgColorBgV.layer.cornerRadius = 8
        contentScrollV.addSubview(bgColorBgV)
        bgColorBgV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(70)
            $0.left.equalTo(nameBgV.snp.right).offset(10)
            $0.top.equalTo(nameBgV.snp.top).offset(0)
        }
        //
        let nameTitleLabel = UILabel()
        bgColorBgV.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(5)
            $0.width.greaterThanOrEqualTo(20)
            $0.height.equalTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 16)
        nameTitleLabel.text = "背景颜色"
        
        //
        bgColorField.backgroundColor = ColorTool.ColorD9D9D9.color()
        bgColorBgV.addSubview(bgColorField)
        bgColorField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(5)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(-40)
        }
        bgColorField.textColor = UIColor.black
        bgColorField.addPaddingLeft(10)
        //

        bgColorBgV.addSubview(bgColorWell)
        bgColorWell.selectedColor = .white
        bgColorWell.snp.makeConstraints {
            $0.centerY.equalTo(bgColorField.snp.centerY)
            $0.right.equalToSuperview().offset(-5)
            $0.width.height.equalTo(30)
        }
        bgColorWell.addTarget(self, action: #selector(viewBackgroundColorValueChange(colorWell: )), for: .valueChanged)
    }
    
    func setupBorderColorV() {
        
        borderColorBgV.backgroundColor = .white
        borderColorBgV.layer.cornerRadius = 8
        contentScrollV.addSubview(borderColorBgV)
        borderColorBgV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(70)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(bgColorBgV.snp.bottom).offset(20)
        }
        //
        let nameTitleLabel = UILabel()
        borderColorBgV.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(5)
            $0.width.greaterThanOrEqualTo(20)
            $0.height.equalTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 16)
        nameTitleLabel.text = "边框颜色"
        
        //
        borderColorField.backgroundColor = ColorTool.ColorD9D9D9.color()
        borderColorBgV.addSubview(borderColorField)
        borderColorField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(5)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(-40)
        }
        borderColorField.textColor = UIColor.black
        borderColorField.addPaddingLeft(10)
        //

        borderColorBgV.addSubview(borderColorWell)
        borderColorWell.selectedColor = .white
        borderColorWell.snp.makeConstraints {
            $0.centerY.equalTo(borderColorField.snp.centerY)
            $0.right.equalToSuperview().offset(-5)
            $0.width.height.equalTo(30)
        }
        borderColorWell.addTarget(self, action: #selector(viewBackgroundColorValueChange(colorWell: )), for: .valueChanged)
    }
    
    func setupBorderWidthV() {
        
//
//        borderWidthBgV.backgroundColor = .white
//        borderWidthBgV.layer.cornerRadius = 8
//        contentScrollV.addSubview(borderWidthBgV)
//        borderWidthBgV.snp.makeConstraints {
//            $0.width.equalTo(180)
//            $0.height.equalTo(70)
//            $0.left.equalTo(borderColorBgV.snp.right).offset(10)
//            $0.top.equalTo(borderColorBgV.snp.top).offset(0)
//        }
//        //
//        let nameTitleLabel = UILabel()
//        borderColorBgV.addSubview(nameTitleLabel)
//        nameTitleLabel.snp.makeConstraints {
//            $0.left.top.equalToSuperview().offset(5)
//            $0.width.greaterThanOrEqualTo(20)
//            $0.height.equalTo(20)
//        }
//        nameTitleLabel.textColor = .black
//        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 16)
//        nameTitleLabel.text = "边框粗细"
//        
//        //
//        let borderWidthBgV = UIView()
//        let borderWidthField = UITextField()
//        
//        
//        borderWidthField.backgroundColor = ColorTool.ColorD9D9D9.color()
//        borderWidthBgV.addSubview(borderWidthField)
//        borderWidthField.snp.makeConstraints {
//            $0.left.equalToSuperview().offset(5)
//            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(5)
//            $0.bottom.equalToSuperview().offset(-5)
//            $0.right.equalToSuperview().offset(-40)
//        }
//        borderWidthField.textColor = UIColor.black
//        borderWidthField.addPaddingLeft(10)
        //
        //
        
        
        
    }
    
}

extension AUtoCustomViewVC {
    @objc func backBtnClick() {
        if self.navigationController != nil {
            self.navigationController?.popViewController()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func topMakeBtnClick() {
        
    }
    
    @objc func nameRandomBtnClick() {
        
    }
    
    @objc func viewBackgroundColorValueChange(colorWell: UIColorWell) {
        colorWell.selectedColor
    }
    
}







 
