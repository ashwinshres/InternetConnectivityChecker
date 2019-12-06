import UIKit

extension UIView {
    
    func noInternetLoadNib<T: UIView>(_: T.Type) where T: ICCReusableView {
        Bundle.main.loadNibNamed(T.defaultReuseIdentifier, owner: self, options: nil)
    }
    
    func noInternetLoadNib<T: UIView>(_: T.Type, _ name: String) where T: ICCReusableView {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
    }
    
    func setAllSideShadow<T: UIView>(_: T.Type,
                                     shadowShowSize: CGFloat = 1.0,
                                     with color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)) where T: ICCReusableView {
        
        let shadowSize: CGFloat = shadowShowSize
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: frame.size.width + shadowSize,
                                                   height: frame.size.height + shadowSize))
        layer.masksToBounds = false
        layer.cornerRadius = 10.0
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
    }
    
    func addCornerRadius<T: UIView>(_: T.Type,
                                    with cornerRadius: CGFloat = 5.0) where T: ICCReusableView {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    func addShadow<T: UIView>(_: T.Type,
                              of color: UIColor,
                              width: CGFloat, height: CGFloat,
                              shadowOpacity: Float) where T: ICCReusableView {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width:width, height: height)
        layer.shadowOpacity = shadowOpacity
        
    }
    
}
