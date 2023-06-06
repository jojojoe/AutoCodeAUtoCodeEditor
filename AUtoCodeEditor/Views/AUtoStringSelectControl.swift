//
//  AUtoStringSelectControl.swift
//  AUtoCodeEditor
//
//  Created by Joe on 2023/5/29.
//

import UIKit

enum StringConfigBtnType: String {
    case typeRandom
    case typeFont
    case typeAlignment
    case typeImageContentMode
    case typeNon
}

class AUtoStringSelectControl: UIView {

    let bgV = UIView()
    let nameTitleLabel = UILabel()
    let textField = UITextField()
    let enableBtn = UIButton()
    let enableMaskView = UIView()
    
    var configBtnType: StringConfigBtnType
    var titNameStr: String
    var currentContentStr: String = "" {
        didSet {
            textField.text = currentContentStr
        }
    }
    var isEnableStatus = false
    var fontSelectBlock: (()->Void)?
    
    
    init(frame: CGRect, titNameStr: String, isEnable: Bool = true, configBtnType: StringConfigBtnType = .typeRandom) {
        self.titNameStr = titNameStr
        self.currentContentStr = titNameStr
        self.isEnableStatus = isEnable
        self.configBtnType = configBtnType
        super.init(frame: frame)
        setupNameBgV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateContentFontName(fontStr: String) {
        currentContentStr = fontStr
        
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
        textField.placeholder = currentContentStr
        textField.delegate = self
        textField.layer.cornerRadius = 6
        textField.addTarget(self, action: #selector(textFieldChange(textfield: )), for: .editingChanged)
        //
        if configBtnType == .typeRandom {
            let nameRandomBtn = UIButton()
            nameRandomBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
            bgV.addSubview(nameRandomBtn)
            nameRandomBtn.snp.makeConstraints {
                $0.centerY.equalTo(textField.snp.centerY)
                $0.right.equalToSuperview().offset(-10)
                $0.width.height.equalTo(30)
            }
            nameRandomBtn.setTitle("R", for: .normal)
            nameRandomBtn.addTarget(self, action: #selector(nameRandomBtnClick), for: .touchUpInside)
        } else if configBtnType == .typeFont {
            let nameFontBtn = UIButton()
            nameFontBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
            bgV.addSubview(nameFontBtn)
            nameFontBtn.snp.makeConstraints {
                $0.centerY.equalTo(textField.snp.centerY)
                $0.right.equalToSuperview().offset(-10)
                $0.width.height.equalTo(30)
            }
            nameFontBtn.setTitle("F", for: .normal)
            nameFontBtn.addTarget(self, action: #selector(nameFontBtnClick), for: .touchUpInside)
        } else if configBtnType == .typeAlignment {
            let alignmentBtn = UIButton()
            alignmentBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
            bgV.addSubview(alignmentBtn)
            alignmentBtn.snp.makeConstraints {
                $0.centerY.equalTo(textField.snp.centerY)
                $0.right.equalToSuperview().offset(-10)
                $0.width.height.equalTo(30)
            }
            alignmentBtn.setTitle("Ali", for: .normal)
            alignmentBtn.addTarget(self, action: #selector(alignmentBtnClick), for: .touchUpInside)
            textField.isEnabled = false
            currentContentStr = AUtoExtension.leftStr
            
        } else if configBtnType == .typeImageContentMode {
            let contentModeBtn = UIButton()
            contentModeBtn.backgroundColor = ColorTool.ColorD9D9D9.color()
            bgV.addSubview(contentModeBtn)
            contentModeBtn.snp.makeConstraints {
                $0.centerY.equalTo(textField.snp.centerY)
                $0.right.equalToSuperview().offset(-10)
                $0.width.height.equalTo(30)
            }
            contentModeBtn.setTitle("M", for: .normal)
            contentModeBtn.addTarget(self, action: #selector(contentModeBtnClick), for: .touchUpInside)
            textField.isEnabled = false
            currentContentStr = AUtoExtension.scaleAspectFit
        } else if configBtnType == .typeNon {
            textField.snp.remakeConstraints {
                $0.left.equalToSuperview().offset(10)
                $0.top.equalTo(nameTitleLabel.snp.bottom).offset(10)
                $0.bottom.equalToSuperview().offset(-10)
                $0.right.equalToSuperview().offset(-10)
            }
        }
        
        
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

    
    @objc func nameRandomBtnClick() {
        // 随机
        
        currentContentStr = ""
    }
    
    @objc func nameFontBtnClick() {
        fontSelectBlock?()
    }
    
    @objc func alignmentBtnClick() {
        
        if currentContentStr == AUtoExtension.leftStr {
            currentContentStr = AUtoExtension.centerStr
        } else if currentContentStr == AUtoExtension.centerStr {
            currentContentStr = AUtoExtension.rightStr
        } else {
            currentContentStr = AUtoExtension.leftStr
        }
        
        
    }
    
    @objc func contentModeBtnClick() {
        
        if currentContentStr == AUtoExtension.scaleAspectFit {
            currentContentStr = AUtoExtension.scaleAspectFill
        } else if currentContentStr == AUtoExtension.scaleAspectFill {
            currentContentStr = AUtoExtension.scaleToFill
        }  else if currentContentStr == AUtoExtension.scaleToFill {
            currentContentStr = AUtoExtension.center
        } else {
            currentContentStr = AUtoExtension.scaleAspectFit
        }
    }
    
    @objc func textFieldChange(textfield: UITextField) {
        if let resultStr = textfield.text?.replacingOccurrences(of: " ", with: ""), resultStr != "" {
            currentContentStr = resultStr
        } else {
            currentContentStr = titNameStr
        }
        
    }
    
    
    @objc func enableBtnClick() {
        enableBtn.isSelected = !enableBtn.isSelected
        isEnableStatus = enableBtn.isSelected
        enableMaskView.isHidden = isEnableStatus
    }
    
}

extension AUtoStringSelectControl: UITextFieldDelegate {
    
}
