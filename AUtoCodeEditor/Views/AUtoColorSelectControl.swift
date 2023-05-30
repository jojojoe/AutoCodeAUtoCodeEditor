//
//  AUtoColorSelectControl.swift
//  AUtoCodeEditor
//
//  Created by Joe on 2023/5/29.
//

import UIKit
import SnapKit
import SwifterSwift

class AUtoColorSelectControl: UIView {

    let bgV = UIView()
    let nameTitleLabel = UILabel()
    let textField = UITextField()
    let colorWell = UIColorWell()
    let enableBtn = UIButton()
    let enableMaskView = UIView()
    var isEnableStatus = false
    
    var titNameStr: String
    
    var currentColorStr: String = ""
    
    init(frame: CGRect, titNameStr: String, currentColorStr: String, isEnable: Bool = true) {
        self.titNameStr = titNameStr
        self.currentColorStr = currentColorStr
        self.isEnableStatus = isEnable
        super.init(frame: frame)
        setupNameBgV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameBgV() {
        //
        bgV.backgroundColor = .white
        bgV.layer.cornerRadius = 8
        bgV.clipsToBounds = true
        addSubview(bgV)
        bgV.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        //
        
        bgV.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(10)
            $0.width.greaterThanOrEqualTo(20)
            $0.height.equalTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 12)
        nameTitleLabel.text = titNameStr
        
        //
        textField.backgroundColor = ColorTool.ColorD9D9D9.color()
        bgV.addSubview(textField)
        textField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalToSuperview().offset(-50)
        }
        textField.textColor = UIColor.black
        textField.addPaddingLeft(10)
        textField.placeholder = (currentColorStr == "") ? "Clear" : currentColorStr
        textField.layer.cornerRadius = 6
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldChange(textfield: )), for: .editingChanged)
        textField.font = FontCusNames.SFProRegular.font(sizePoint: 14)
        //
        
        bgV.addSubview(colorWell)
        colorWell.selectedColor = .white
        colorWell.snp.makeConstraints {
            $0.centerY.equalTo(textField.snp.centerY)
            $0.right.equalToSuperview().offset(-10)
            $0.width.height.equalTo(30)
        }
        colorWell.addTarget(self, action: #selector(viewBackgroundColorValueChange(colorWell: )), for: .valueChanged)
        
        //
        bgV.addSubview(enableMaskView)
        enableMaskView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        enableMaskView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        //
        bgV.addSubview(enableBtn)
        enableBtn.snp.makeConstraints {
            $0.centerY.equalTo(nameTitleLabel.snp.centerY)
            $0.right.equalToSuperview().offset(-10)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        enableBtn.layer.cornerRadius = 12
        enableBtn.clipsToBounds = true
        enableBtn.setBackgroundImage(UIImage(color: UIColor.lightGray, size: CGSize(width: 32, height: 24)), for: .normal)
        enableBtn.setBackgroundImage(UIImage(color: UIColor.systemGreen, size: CGSize(width: 32, height: 24)), for: .selected)
        enableBtn.addTarget(self, action: #selector(enableBtnClick), for: .touchUpInside)
        
        //
        enableBtn.isSelected = isEnableStatus
        enableMaskView.isHidden = isEnableStatus
    }

   
    
    
    @objc func textFieldChange(textfield: UITextField) {
        if let resultStr = textfield.text?.replacingOccurrences(of: " ", with: ""), resultStr != "" {
            currentColorStr = resultStr
        } else {
            currentColorStr = ""
        }
    }
    
    
    @objc func viewBackgroundColorValueChange(colorWell: UIColorWell) {
        if let hexStr = colorWell.selectedColor?.toHexString(), hexStr != "" {
            currentColorStr = hexStr
            textField.text = hexStr
        } else {
            currentColorStr = ""
            textField.text = ""
        }
    }
    
    @objc func enableBtnClick() {
        enableBtn.isSelected = !enableBtn.isSelected
        isEnableStatus = enableBtn.isSelected
        enableMaskView.isHidden = isEnableStatus
    }
    
}

extension AUtoColorSelectControl: UITextFieldDelegate {
    
}
