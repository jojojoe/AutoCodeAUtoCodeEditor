//
//  AUtoEnableSwitchControl.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/30.
//

import UIKit

class AUtoEnableSwitchControl: UIView {
    
    var titNameStr: String
    var currentPropertyNameStr: String
    var isEnableStatus: Bool
    
    let bgV = UIView()
    let nameTitleLabel = UILabel()
    let enableBtn = UIButton()
    let enableMaskView = UIView()
    
    init(frame: CGRect, titNameStr: String, currentPropertyNameStr: String, isEnable: Bool = true) {
        self.titNameStr = titNameStr
        self.currentPropertyNameStr = currentPropertyNameStr
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
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.greaterThanOrEqualTo(20)
            $0.height.greaterThanOrEqualTo(20)
        }
        nameTitleLabel.textColor = .black
        nameTitleLabel.font = FontCusNames.MontBold.font(sizePoint: 12)
        nameTitleLabel.text = titNameStr
        
        
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
    
    @objc func enableBtnClick() {
        enableBtn.isSelected = !enableBtn.isSelected
        isEnableStatus = enableBtn.isSelected
        enableMaskView.isHidden = isEnableStatus
    }
    
}
