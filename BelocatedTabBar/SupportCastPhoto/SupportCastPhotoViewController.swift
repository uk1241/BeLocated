//
//  SupportCastPhotoViewController.swift
//  BelocatedTabBar
//
//  Created by Samuel Sajeev on 07/02/24.
//

import UIKit
import TOCropViewController
class SupportCastPhotoViewController: UIViewController {
    
//    outlets
    @IBOutlet weak var photoBackgrndDashedLineView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var whyWeAskBackgroundView: UIView!
    @IBOutlet weak var photoClickBtnOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        whyWeAskBackgroundView.applyGradient()
        whyWeAskBackgroundView.layer.masksToBounds = true
        whyWeAskBackgroundView.layer.borderWidth = 1
        whyWeAskBackgroundView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        whyWeAskBackgroundView.layer.cornerRadius = 16
        photoBackgrndDashedLineView.layer.cornerRadius = 0.5 * photoBackgrndDashedLineView.bounds.size.width
        photoImageView.layer.cornerRadius = 0.5 * photoImageView.bounds.size.width
        photoClickBtnOutlet.layer.cornerRadius = 0.5 * photoClickBtnOutlet.bounds.size.width
        photoBackgrndDashedLineView.addDashedBorder()
        

    }
    
    @IBAction func photoClickBtnAction(_ sender: Any) {
        let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                
                // Present TOCropViewController after selecting an image
                imagePicker.allowsEditing = false // We don't need UIImagePickerController's built-in editing
                
                present(imagePicker, animated: true, completion: nil)
    }
    


}

extension UIView
{
    
    func applyGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 235/255, green: 234/255, blue: 234/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 254/255, blue: 253/255, alpha: 1).cgColor]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func ThreeColorGradient()
        {
            let gradientLayer = CAGradientLayer()
//            gradientLayer.colors = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor,UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1).cgColor,UIColor(red: 235/255, green: 234/255, blue: 234/255, alpha: 1).cgColor]
            gradientLayer.colors = [UIColor(red: 235/255, green: 234/255, blue: 234/255, alpha: 1).cgColor,UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor]
            gradientLayer.cornerRadius = layer.cornerRadius
            gradientLayer.startPoint = CGPoint(x: 0,y:0)
            gradientLayer.endPoint = CGPoint(x:1,y:0)
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)
        }
    func addDashedBorder() {
        let color = UIColor(red: 162/255, green: 130/255, blue: 0/255, alpha: 1).cgColor
        
        let shapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        
        // Adjust radius based on the smaller dimension to ensure the circle fits within the frame
        let radius = min(frameSize.width, frameSize.height) / 2
        
        shapeLayer.bounds = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6, 3]
        
        let path = UIBezierPath(arcCenter: CGPoint(x: frameSize.width / 2, y: frameSize.height / 2), radius: radius - 1, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
}
extension SupportCastPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        
        let cropViewController = TOCropViewController(image: selectedImage)
        cropViewController.delegate = self
        cropViewController.aspectRatioPreset = .presetSquare // Set square aspect ratio for circular cropping
        cropViewController.aspectRatioLockEnabled = true // Lock aspect ratio to square
        cropViewController.resetAspectRatioEnabled = false // Disable aspect ratio reset button
        cropViewController.aspectRatioPickerButtonHidden = true // Hide aspect ratio picker button
        
        picker.dismiss(animated: true) {
            self.present(cropViewController, animated: true, completion: nil)
        }
    }
}
//extension SupportCastPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//            if let editedImage = info[.editedImage] as? UIImage {
//                photoImageView.image = editedImage
//            } else if let originalImage = info[.originalImage] as? UIImage {
//                photoImageView.image = originalImage
//            }
//            picker.dismiss(animated: true, completion: nil)
//        }
//}

extension SupportCastPhotoViewController: TOCropViewControllerDelegate {
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        // Handle the cropped image here
        photoImageView.image = image
        
        // Dismiss the crop view controller
        cropViewController.dismiss(animated: true, completion: nil)
    }
}
