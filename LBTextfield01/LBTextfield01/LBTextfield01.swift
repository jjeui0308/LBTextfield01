
//
//  GHTextInputView01.swift
//  KongNaMul
//
//  Created by gh_macmini on 2018. 4. 23..
//  Copyright © 2018년 Justin. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(displayP3Red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}



class LBTextfield01: UIView {
    
    //Variables to configure details
    public var borderWidth: CGFloat = 0.5
    public var borderColour: CGColor = UIColor.init(hexString: "b6b6b6").cgColor
    public var cornerRadius: CGFloat = 5
    public var leadingMarginForIcon: CGFloat = 12
    public var leadingMarginForTextfield: CGFloat = 12
    public var isTextProvided: Bool = false
    public var inputText: String? { return self.textfield.text }
    
    
    private var highlightedIconImage: UIImage?
    private var defaultIconImage: UIImage?
    
    private let iconIV: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.addTarget(self, action: #selector(handleTextfieldBeingEdited), for: .editingChanged)
        return textfield
    }()
    
    @objc private func handleTextfieldBeingEdited(_ sender: UITextField) {
        self.iconIV.image = (sender.text?.isEmpty)! ? defaultIconImage : highlightedIconImage
        self.isTextProvided = (sender.text?.isEmpty)! ? false : true
    }
    
    convenience init(highlightedIconImage: UIImage, defaultIconImage: UIImage, attributedPlaceholder: NSAttributedString, inputTextAttributes: [NSAttributedStringKey: Any], keyboardType: UIKeyboardType = .default) {
        self.init(frame: .zero)
        self.highlightedIconImage = highlightedIconImage
        self.defaultIconImage = defaultIconImage
        self.iconIV.image = defaultIconImage
        self.textfield.attributedPlaceholder = attributedPlaceholder
        self.textfield.attributedText = NSAttributedString(string: "", attributes: inputTextAttributes)
        self.textfield.keyboardType = keyboardType
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColour
        self.layer.cornerRadius =  self.cornerRadius
        setupLayout()
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    private var iconImageWidthConstraint: NSLayoutConstraint?
    private var iconImageHeightConstraint: NSLayoutConstraint?
    
    private func setupLayout() {
        addSubview(iconIV)
        addSubview(textfield)
        
        NSLayoutConstraint.activate([
            
            iconIV.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconIV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.leadingMarginForIcon),
            iconIV.widthAnchor.constraint(equalToConstant: (defaultIconImage?.size.width)!),
            iconIV.heightAnchor.constraint(equalToConstant: (defaultIconImage?.size.height)!),
            
            textfield.leadingAnchor.constraint(equalTo: iconIV.trailingAnchor, constant: self.leadingMarginForTextfield),
            textfield.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textfield.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.leadingMarginForTextfield),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LBTextfield01 {
    
    //Accessible Properties
    public var attributedPlaceholder: NSAttributedString {
        get {
            return self.attributedPlaceholder
        }
        set {
            self.textfield.attributedPlaceholder = newValue
        }
    }
    
    
}















































































