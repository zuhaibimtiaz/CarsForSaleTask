
import UIKit
import Kingfisher
import MBProgressHUD

extension UIViewController{
    func simpleAlert(title : String , msg : String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startActivity() {
        self.view.endEditing(true)
        MBProgressHUD.showAdded(to: self.view, animated:true)
    }
    
    func stopActivity (containerView: UIView? = nil) {
        if let v = containerView{
            MBProgressHUD.hide(for: v, animated: true)
        }else{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension UIView {
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    func addShadow(shadowColor: CGColor = UIColor.gray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 0.5),
                   shadowOpacity: Float = 0.5,
                   shadowRadius: CGFloat = 2.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
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

extension UIImageView {
    
    func roundCorner() {
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds = true
    }
    
    func set(url: URL, placeholder: String = "placeholder") {
        self.kf.setImage(with: url,placeholder: UIImage(named: placeholder))
    }
    
    func set(urlString: String, placeholder: String = "placeholder") {
        if let url = URL(string: urlString.replacingOccurrences(of: " ", with: "%20")) {
            set(url: url, placeholder: placeholder)
        }else {
            self.image = UIImage(named: placeholder)
        }
    }
    
    func getImage(urlString: String, completionHandler: @escaping (_ imageSize: CGSize?) -> Void) {
        if let url = URL(string: urlString) {
            self.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil) { (result) in
                switch result {
                case .success(let value):
                    let imageSize = value.image.size
                    completionHandler(imageSize)
                    break
                case .failure(_):
                    completionHandler(nil)
                    break
                }
            }
        }
    }
    
    func set(url: URL, completion: @escaping () -> Void) {
        self.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil) { (result) in
            switch result {
            case .success(_):
                completion()
                break
            case .failure(_):
                completion()
                break
            }
        }
    }
}
extension String{
    public func htmlEncodedString() -> String{
        if let str = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            return str
        }
        else{
            return self
        }
    }    
}
