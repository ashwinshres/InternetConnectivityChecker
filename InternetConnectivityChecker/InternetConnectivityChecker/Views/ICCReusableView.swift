import UIKit

protocol ICCReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ICCReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol ICCNibLoadableView: class {
    static var nibName: String { get }
}

extension ICCNibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
