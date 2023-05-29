//
//  ViewController.swift
//  AUtoCodeEditor
//
//  Created by JOJO on 2023/5/29.
//

import UIKit
import SnapKit
import SwifterSwift

enum EditItemType: String {
    case view
    case button
    case label
    case imageView
    case attributeString
}


class ViewController: UIViewController {

    var collection: UICollectionView!
    var itemList: [EditItemType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupConent()
        
        
    }


}

extension ViewController {
    func loadData() {
        itemList = [.view, .button, .label, .imageView, .attributeString]
    }
    
    func setupConent() {
        view.backgroundColor = UIColor(hexString: "#EFEFEF")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        collection.snp.makeConstraints {
            $0.top.bottom.right.left.equalToSuperview()
        }
        collection.register(cellWithClass: AUtoListCell.self)
        
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: AUtoListCell.self, for: indexPath)
        let itemT = itemList[indexPath.item]
        cell.titNameLabel.text = itemT.rawValue
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 20
        let btnW: CGFloat = (UIScreen.main.bounds.width - padding * 3 - 1)/2
        let btnH: CGFloat = 70
        return CGSize(width: btnW, height: btnH)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemT = itemList[indexPath.item]
        switch itemT {
        case .view:
            self.enterViewVC()
            break
        case .label:
            break
        case .button:
            break
        case .imageView:
            break
        case .attributeString:
            break
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}


extension ViewController {
    func enterViewVC() {
        let vc = AUtoCustomViewVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



class AUtoListCell: UICollectionViewCell {
    let contentImgV = UIImageView()
    let titNameLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.layer.cornerRadius = 14
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        //
        contentImgV.contentMode = .scaleAspectFill
        contentImgV.clipsToBounds = true
        contentView.addSubview(contentImgV)
        contentImgV.snp.makeConstraints {
            $0.top.right.bottom.left.equalToSuperview()
        }
        
        contentView.addSubview(titNameLabel)
        titNameLabel.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        titNameLabel.adjustsFontSizeToFitWidth = true
        titNameLabel.font = UIFont(name: "AvenirNext-Bold", size: 18)
        titNameLabel.textColor = .black
        titNameLabel.textAlignment = .center
        
    }
}
