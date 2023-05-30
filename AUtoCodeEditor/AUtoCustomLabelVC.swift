//
//  AUtoCustomLabelVC.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/30.
//

import UIKit
import SnapKit

class AUtoCustomLabelVC: UIViewController {

    let previewView = UILabel()
    let contentScrollV = UIScrollView()
    
    //
    let nameControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "ControlName")
    let contentTextControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "ContentText", configBtnType: .typeNone)
    let bgColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Bg Color", currentColorStr: "", isEnable: false)
    let alphaControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Alpha", currentValue: 0.5, isEnable: false)
    
    let labelTitleContentControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Title Content", configBtnType: .typeNone)
    let labelTitleFontControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Title Font", configBtnType: .typeFont)
    let labelTitleColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Title Color", currentColorStr: "#000000")
    
    let numberLinesControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Number of Lines", currentValue: 0, isEnable: false)
    let adjustFitWidthControlV = AUtoEnableSwitchControl(frame: .zero, titNameStr: "AdjustFitWidth", currentPropertyNameStr: "adjustsFontSizeToFitWidth", isEnable: false)
    let textAlignmentControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Alignment", isEnable: false, configBtnType: .typeAlignment)
    
    let borderColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Border Color", currentColorStr: "", isEnable: false)
    let borderWidthControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Border Width", currentValue: 1.0, isEnable: false)
    let borderCornerControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Corner Radius", currentValue: 1.0, isEnable: false)
    let shadowColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Shadow Color", currentColorStr: "", isEnable: false)
    let shadowRadiusControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Shadow Radius", currentValue: 3.0, isEnable: false)
    let shadowOffxControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Shadow Offx", currentValue: 0.0, isEnable: false)
    let shadowOffyControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Shadow Offy", currentValue: 2.0, isEnable: false)
    let shadowOpacityControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Shadow Opacity", currentValue: 0.8, isEnable: false)
    
    
    
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
        setupAlphaV()
        setupTextControlV()
        setupImageControlV()
        setupBorderControlV()
        setupShadowControlV()
     
        setupDefaultStatus()
    }
    
    func setupDefaultStatus() {
        nameControlV.currentContentStr = "label"
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
        contentScrollV.contentSize = CGSize(width: 414 + 20, height: 900)
        contentScrollV.backgroundColor = ColorTool.ColorF0F0F0.color()
        
    }

    
}

extension AUtoCustomLabelVC {
    func setupNameBgV() {
        contentScrollV.addSubview(nameControlV)
        nameControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(20)
        }
        
        contentScrollV.addSubview(contentTextControlV)
        contentTextControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalTo(nameControlV.snp.right).offset(10)
            $0.top.equalTo(nameControlV.snp.top).offset(0)
        }
        
    }
    
    //
    func setupBackgroundColorV() {
        
        contentScrollV.addSubview(bgColorControlV)
        bgColorControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(nameControlV.snp.bottom).offset(20)
        }

    }
    
    //
    func setupAlphaV() {
        contentScrollV.addSubview(alphaControlV)
        alphaControlV.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(90)
            $0.left.equalTo(bgColorControlV.snp.right).offset(10)
            $0.top.equalTo(bgColorControlV.snp.top).offset(0)
        }
    }
    //
    func setupTextControlV() {
        contentScrollV.addSubview(labelTitleContentControlV)
        labelTitleContentControlV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(bgColorControlV.snp.bottom).offset(20)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        //
        contentScrollV.addSubview(labelTitleFontControlV)
        labelTitleFontControlV.snp.makeConstraints {
            $0.left.equalTo(labelTitleContentControlV.snp.right).offset(10)
            $0.top.equalTo(labelTitleContentControlV.snp.top).offset(0)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        labelTitleFontControlV.fontSelectBlock = {
            [weak self] in
            guard let `self` = self else {return}
            DispatchQueue.main.async {
                self.showFontSelectPopV()
            }
        }
        //
        contentScrollV.addSubview(labelTitleColorControlV)
        labelTitleColorControlV.snp.makeConstraints {
            $0.left.equalTo(labelTitleFontControlV.snp.right).offset(10)
            $0.top.equalTo(labelTitleContentControlV.snp.top).offset(0)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        
    }
    
    
    //
    func setupImageControlV() {
        //
        contentScrollV.addSubview(textAlignmentControlV)
        textAlignmentControlV.snp.makeConstraints {
            $0.top.equalTo(labelTitleContentControlV.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(180)
            $0.height.equalTo(90)
        }
        
        //
        contentScrollV.addSubview(numberLinesControlV)
        numberLinesControlV.snp.makeConstraints {
            $0.top.equalTo(textAlignmentControlV.snp.top).offset(0)
            $0.left.equalTo(textAlignmentControlV.snp.right).offset(10)
            $0.width.equalTo(180)
            $0.height.equalTo(90)
        }
        //
        contentScrollV.addSubview(adjustFitWidthControlV)
        adjustFitWidthControlV.snp.makeConstraints {
            $0.top.equalTo(textAlignmentControlV.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(180)
            $0.height.equalTo(50)
        }
        
      
        
        
    }
    
    
    //
    func setupBorderControlV() {
        
        contentScrollV.addSubview(borderColorControlV)
        borderColorControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(adjustFitWidthControlV.snp.bottom).offset(20)
        }
        //
        contentScrollV.addSubview(borderWidthControlV)
        borderWidthControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(borderColorControlV.snp.right).offset(10)
            $0.top.equalTo(borderColorControlV.snp.top).offset(0)
        }
        //
        contentScrollV.addSubview(borderCornerControlV)
        borderCornerControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(borderWidthControlV.snp.right).offset(10)
            $0.top.equalTo(borderColorControlV.snp.top).offset(0)
        }
    }
    
    func setupShadowControlV() {
        
        contentScrollV.addSubview(shadowColorControlV)
        shadowColorControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(borderColorControlV.snp.bottom).offset(20)
        }
        //
        contentScrollV.addSubview(shadowRadiusControlV)
        shadowRadiusControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(shadowColorControlV.snp.right).offset(10)
            $0.top.equalTo(shadowColorControlV.snp.top).offset(0)
        }
        //
        contentScrollV.addSubview(shadowOpacityControlV)
        shadowOpacityControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(shadowRadiusControlV.snp.right).offset(10)
            $0.top.equalTo(shadowColorControlV.snp.top).offset(0)
        }
        
        //
        contentScrollV.addSubview(shadowOffxControlV)
        shadowOffxControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(shadowColorControlV.snp.left).offset(0)
            $0.top.equalTo(shadowColorControlV.snp.bottom).offset(10)
        }
        //
        contentScrollV.addSubview(shadowOffyControlV)
        shadowOffyControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalTo(shadowOffxControlV.snp.right).offset(10)
            $0.top.equalTo(shadowOffxControlV.snp.top).offset(0)
        }
        
        
        
        
        
        
    }
    
}

extension AUtoCustomLabelVC {
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
    
    func showFontSelectPopV() {
        
    }
   
}







 
