//
//  AUtoValueSelectControl.swift
//  AUtoCodeEditor
//
//  Created by Joe on 2023/5/29.
//

import UIKit
import SnapKit
import SwifterSwift

class AUtoValueSelectControl: UIView {

    let bgV = UIView()
    let nameTitleLabel = UILabel()
    let textField = UITextField()
    let colorWell = UIColorWell()
    let enableBtn = UIButton()
    let enableMaskView = UIView()
    var isEnableStatus = false
    
    var titNameStr: String
    var currentValue: CGFloat = 0 {
        didSet {
            textField.text = "\(currentValue)"
        }
    }
    
    init(frame: CGRect, titNameStr: String, currentValue: CGFloat, isEnable: Bool = true) {
        self.titNameStr = titNameStr
        self.currentValue = currentValue
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
        textField.font = FontCusNames.SFProRegular.font(sizePoint: 14)
        textField.textColor = UIColor.black
        textField.addPaddingLeft(10)
        textField.placeholder = "\(currentValue)"
        textField.layer.cornerRadius = 6
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldChange(textfield: )), for: .editingChanged)
        
        //
        let upBtn = UIButton()
        upBtn.backgroundColor = UIColor.black
        bgV.addSubview(upBtn)
        upBtn.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalTo(textField.snp.centerY).offset(-0.5)
            $0.width.equalTo(30)
            $0.top.equalTo(textField.snp.top)
        }
        upBtn.addTarget(self, action: #selector(upBtnClick), for: .touchUpInside)
        //
        let lowBtn = UIButton()
        lowBtn.backgroundColor = UIColor.black
        bgV.addSubview(lowBtn)
        lowBtn.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(textField.snp.centerY).offset(0.5)
            $0.width.equalTo(30)
            $0.bottom.equalTo(textField.snp.bottom)
        }
        lowBtn.addTarget(self, action: #selector(lowBtnClick), for: .touchUpInside)
        
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
        if let resultStr = textfield.text?.replacingOccurrences(of: " ", with: ""), resultStr != "", let resultValue = resultStr.cgFloat() {
            currentValue = resultValue
        } else {
            
        }
    }
    
    @objc func upBtnClick() {
        currentValue = currentValue + 1.0
        
    }
    
    @objc func lowBtnClick() {
        currentValue = currentValue - 1.0
        
    }
    
    @objc func enableBtnClick() {
        enableBtn.isSelected = !enableBtn.isSelected
        isEnableStatus = enableBtn.isSelected
        enableMaskView.isHidden = isEnableStatus
    }
    
}

extension AUtoValueSelectControl: UITextFieldDelegate {
    
}
