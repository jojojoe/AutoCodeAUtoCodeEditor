//
//  AUtoCustomButtonVC.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/30.
//

import UIKit
import SnapKit

class AUtoCustomButtonVC: UIViewController {

    let previewView = UIButton()
    let contentScrollV = UIScrollView()
    
    //
    let nameControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "ControlName")
    let bgColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Bg Color", currentColorStr: "")
    let alphaControlV = AUtoValueSelectControl(frame: .zero, titNameStr: "Alpha", currentValue: 0.5, isEnable: false)
    
    let btnTitleContentControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Title Content", configBtnType: .typeNone)
    let btnTitleFontControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Title Font", configBtnType: .typeFont)
    let btnTitleColorControlV = AUtoColorSelectControl(frame: .zero, titNameStr: "Title Color", currentColorStr: "#000000")
    
    let btnImageNameControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Content Image", isEnable: false, configBtnType: .typeNone)
    let btnImageNameSelectedControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Content Image Selected", isEnable: false, configBtnType: .typeNone)
    let btnBgImageNameControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Bg Image", isEnable: false, configBtnType: .typeNone)
    let btnBgImageNameSelectedControlV = AUtoStringSelectControl(frame: .zero, titNameStr: "Bg Image Selected", isEnable: false, configBtnType: .typeNone)
    
    
    
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

extension AUtoCustomButtonVC {
    func setupNameBgV() {
        contentScrollV.addSubview(nameControlV)
        nameControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(20)
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
        contentScrollV.addSubview(btnTitleContentControlV)
        btnTitleContentControlV.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(bgColorControlV.snp.bottom).offset(20)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        //
        contentScrollV.addSubview(btnTitleFontControlV)
        btnTitleFontControlV.snp.makeConstraints {
            $0.left.equalTo(btnTitleContentControlV.snp.right).offset(10)
            $0.top.equalTo(btnTitleContentControlV.snp.top).offset(0)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        btnTitleFontControlV.fontSelectBlock = {
            [weak self] in
            guard let `self` = self else {return}
            DispatchQueue.main.async {
                self.showFontSelectPopV()
            }
        }
        //
        contentScrollV.addSubview(btnTitleColorControlV)
        btnTitleColorControlV.snp.makeConstraints {
            $0.left.equalTo(btnTitleFontControlV.snp.right).offset(10)
            $0.top.equalTo(btnTitleContentControlV.snp.top).offset(0)
            $0.width.equalTo(120)
            $0.height.equalTo(90)
        }
        
    }
    
    
    //
    func setupImageControlV() {
        //
        contentScrollV.addSubview(btnImageNameControlV)
        btnImageNameControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(btnTitleContentControlV.snp.bottom).offset(20)
        }
        //
        contentScrollV.addSubview(btnImageNameSelectedControlV)
        btnImageNameSelectedControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalTo(btnImageNameControlV.snp.right).offset(10)
            $0.top.equalTo(btnImageNameControlV.snp.top).offset(0)
        }
        
        //
        contentScrollV.addSubview(btnBgImageNameControlV)
        btnBgImageNameControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(btnImageNameControlV.snp.bottom).offset(20)
        }
        //
        contentScrollV.addSubview(btnBgImageNameSelectedControlV)
        btnBgImageNameSelectedControlV.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(90)
            $0.left.equalTo(btnBgImageNameControlV.snp.right).offset(10)
            $0.top.equalTo(btnBgImageNameControlV.snp.top).offset(0)
        }
        
        //
         
        
        
    }
    
    
    //
    func setupBorderControlV() {
        
        contentScrollV.addSubview(borderColorControlV)
        borderColorControlV.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(90)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(btnBgImageNameControlV.snp.bottom).offset(20)
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

extension AUtoCustomButtonVC {
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







 
