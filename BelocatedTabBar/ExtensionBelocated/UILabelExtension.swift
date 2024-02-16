//
//  UILabelExtension.swift
//  Girfalco
//
//  Created by AppsTeamMacMini on 11/03/22.
//

import Foundation
import UIKit


class LabelPadding: UILabel {
     var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(
            top: -textInsets.top,
            left: -textInsets.left,
            bottom: -textInsets.bottom,
            right: -textInsets.right
        )
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
@IBDesignable
extension LabelPadding
{
    @IBInspectable
       var leftTextInset: CGFloat {
           set { textInsets.left = newValue }
           get { return textInsets.left }
       }
    @IBInspectable
       var rightTextInset: CGFloat {
           set { textInsets.right = newValue }
           get { return textInsets.right }
       }
}

@IBDesignable
class LineSpacingLabel: UILabel {

    @IBInspectable var lineSpacing: CGFloat = 0 {
        didSet {
            updateText()
        }
    }

    override var text: String? {
        didSet {
            updateText()
        }
    }

    private func updateText() {
        guard let text = text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
