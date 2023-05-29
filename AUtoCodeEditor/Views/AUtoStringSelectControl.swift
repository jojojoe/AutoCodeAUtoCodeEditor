//
//  AUtoStringSelectControl.swift
//  AUtoCodeEditor
//
//  Created by Joe on 2023/5/29.
//

import UIKit

class AUtoStringSelectControl: UIView {

    let bgV = UIView()
    let nameTitleLabel = UILabel()
    let textField = UITextField()
    
    var titNameStr: String
    
    var currentContentStr: String = ""
    
    init(frame: CGRect, titNameStr: String) {
        self.titNameStr = titNameStr
        self.currentContentStr = titNameStr
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
        addSubview(bgV)
        bgV.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        //
        
        bgV.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(5)
            $0.width.greaterThanOrEqualTo(20)
            $0.height.equalTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 16)
        nameTitleLabel.text = titNameStr
        
        //
        textField.backgroundColor = ColorTool.ColorD9D9D9.color()
        bgV.addSubview(textField)
        textField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(5)
            $0.top.equalTo(nameTitleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(-40)
        }
        textField.textColor = UIColor.black
        textField.addPaddingLeft(10)
        textField.placeholder = currentContentStr
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldChange(textfield: )), for: .editingChanged)
        //
        let nameRandomBtn = UIButton()
        nameRandomBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
        bgV.addSubview(nameRandomBtn)
        nameRandomBtn.snp.makeConstraints {
            $0.centerY.equalTo(textField.snp.centerY)
            $0.right.equalToSuperview().offset(-5)
            $0.width.height.equalTo(30)
        }
        nameRandomBtn.setTitle("R", for: .normal)
        nameRandomBtn.addTarget(self, action: #selector(nameRandomBtnClick), for: .touchUpInside)
    }

    
    @objc func nameRandomBtnClick() {
        // 随机
        textField.text = ""
        currentContentStr = ""
    }
    
    
    @objc func textFieldChange(textfield: UITextField) {
        if let resultStr = textfield.text?.replacingOccurrences(of: " ", with: ""), resultStr != "" {
            currentContentStr = resultStr
        } else {
            currentContentStr = titNameStr
        }
        
    }
    
}

extension AUtoStringSelectControl: UITextFieldDelegate {
    
}
