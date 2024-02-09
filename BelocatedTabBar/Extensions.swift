//
//  Extensions.swift
//  BelocatedTabBar
//
//  Created by R Unnikrishnan on 08/07/23.
//

import Foundation
import UIKit
//extension for custom segment
extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: UIColor.white/*backgroundColor!*/), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .clear), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .clear), for: .highlighted, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .clear), for: [.selected, .highlighted], barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
//custom view
@IBDesignable
class CustomView: UIView{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        
        didSet{
            
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
}
//to add corner radius to the view
extension UIView {
    func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
//to add gradient to th view
extension UIView {
    func addGradient(startColor: UIColor, endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}


//pop up view extesnion
extension UIViewController {
    func toggleDoneViewAnimation(doneView: UIView, bgImage: UIImageView, completion: (() -> Void)? = nil) {
        bgImage.isHidden = false
        let isHidden = doneView.isHidden
        doneView.isHidden = !isHidden
        
        let initialYPosition = self.view.frame.height
        let finalYPosition = self.view.frame.height - doneView.frame.height
        doneView.frame.origin.y = initialYPosition
        
        UIView.animate(withDuration: 0.3, animations: {
            doneView.frame.origin.y = isHidden ? finalYPosition : initialYPosition
        }, completion: { _ in
            completion?()
        })
    }
}
//making the button Rounded
extension UIButton {
    func makeRounded() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}

//segmentControl Customisation
extension UISegmentedControl {
    func applyCustomStyle(borderColorHex: String) {
        guard let borderColor = UIColor(hexString: borderColorHex) else {
            print("Invalid hex color")
            return
        }
        
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = true
        
        // Customize the text color for the selected and normal states
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected) // Update to black color for selected state
        
        // Customize the background color for the selected and normal states
        setBackgroundImage(createImageWithColor(color: .white), for: .normal, barMetrics: .default)
        setBackgroundImage(createImageWithColor(color: borderColor), for: .selected, barMetrics: .default)
        
        // Apply rounded border to each segment
        let segmentSubviews = subviews.flatMap { $0.subviews }
        for segmentSubview in segmentSubviews {
            segmentSubview.layer.masksToBounds = true
        }
    }
    
    private func createImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")
        
        var rgbValue: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&rgbValue) else {
            return nil
        }
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
//Roundede Corner Segment
class YourSegmentedControl: UISegmentedControl {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
    }
}
//Custom NavigationBar
extension UIViewController {
    func setupCustomNavigationBar() {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the background color to clear (transparent)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        // Apply blur effect
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(visualEffectView)
        
        // Apply brightness
        navigationBar.tintColor = UIColor(hue: 0, saturation: 0, brightness: -0.05, alpha: 1)
        
        // Add the navigation bar to the view
        view.addSubview(navigationBar)
        
        // Set constraints for the navigation bar
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44) // Adjust the height as needed
        ])
        
        // Customize the navigation bar appearance
        navigationBar.isTranslucent = true // Make the navigation bar translucent
        navigationBar.backgroundColor = UIColor.clear // Set background color to clear
        
        // Create a navigation item
        let navigationItem = UINavigationItem()
        
        // Create an image view and center it horizontally
        let imageView = UIImageView(image: UIImage(named: "beLocatedLogo"))
        imageView.contentMode = .center
        
        // Set the frame of the imageView to match the navigation bar's frame
        imageView.frame = CGRect(x: 0, y: 0, width: 223.88, height: 78.39)
        
        navigationItem.titleView = imageView
        
        // Set the navigation item
        navigationBar.items = [navigationItem]
    }
}



//Gradient View
@IBDesignable
public class Gradient: UIView {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
    
}

//GradientButton
@IBDesignable
public class GradientButton : UIButton {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
    
}

extension UICollectionView {
    func setupVerticalCarousel() {
        // Configure the layout for the carousel
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionViewLayout = layout
        
        // Set up the content inset to center the items
        let inset = (self.frame.height - layout.itemSize.height) / 2
        self.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
        
        // Register a UICollectionViewCell subclass for your carousel
        self.register(CarouselCell.self, forCellWithReuseIdentifier: "CarouselCell")
    }
}

class CarouselCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add and configure the image view
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UITabBar {
    
    func setCustomItems(items: [UITabBarItem]) {
        self.items = items
        self.tintColor = .black
        self.barTintColor = .white
        self.isTranslucent = false
    }
    
}

class ProminentTabBar: UITabBar {
    var prominentButtonCallback: (()->())?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let items = items, items.count>0 else {
            return super.hitTest(point, with: event)
        }
        
        let middleItem = items[items.count/2]
        let middleExtra = middleItem.imageInsets.top
        let middleWidth = bounds.width/CGFloat(items.count)
        let middleRect = CGRect(x: (bounds.width-middleWidth)/2, y: middleExtra, width: middleWidth, height: abs(middleExtra))
        if middleRect.contains(point) {
            prominentButtonCallback?()
            return nil
        }
        return super.hitTest(point, with: event)
    }
}
