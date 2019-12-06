import UIKit

class ICCViewHandler: NSObject {
    
    static let shared: ICCViewHandler = { return ICCViewHandler() }()
    
    var window: UIWindow?
    
    private var noInternetConnectionView: UIView?
    private var isNoInternetViewShown = false
    
    override init() {
        super.init()
        window = ICCHelper.getAppWindow()
    }
    
    func showNoInternetView() {
        DispatchQueue.main.async {
            self.noInternetConnectionView = UIView(frame: CGRect(x: 0,
                                                                 y: ICCHelper.getNoInternetViewHeight(),
                                                                 width: ICCHelper.getScreenWidth(),
                                                                 height: ICCHelper.getNoInternetViewHeight()))
            self.noInternetConnectionView?.backgroundColor = .clear
            self.noInternetConnectionView?.addSubview(self.getNoInternetConnectionView())
            self.showNoInternetConnectionView()
        }
        
    }
    
    private func showNoInternetConnectionView() {
        guard let noInternetConnectionView = noInternetConnectionView else { return }
        if isNoInternetViewShown { return }
        ICCHelper.getAppWindow()?.addSubview(noInternetConnectionView)
        noInternetConnectionView.layoutIfNeeded()
        showNoInternetConnectionView(noInternetConnectionView)
    }
    
    private func getNoInternetConnectionView() -> NoInternetConnectionView {
        let frame = CGRect(x: 0,
                           y: 0,
                           width: ICCHelper.getScreenWidth(),
                           height: ICCHelper.getNoInternetViewHeight())
        let noInternetConnectionView = NoInternetConnectionView(frame: frame)
        noInternetConnectionView.layoutIfNeeded()
        return noInternetConnectionView
    }
    
    private func showNoInternetConnectionView(_ view: UIView) {
        isNoInternetViewShown = true
        let originY =  -(ICCHelper.topSafeAreaInset)
        //swiftlint:disable multiple_closures_with_trailing_closure
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction], animations: {
            view.frame.origin.y =  originY
        }) { _ in }
    }
    
    func hideNoInternetConnectionView() {
        guard let noInternetConnectionView = noInternetConnectionView else { return }
        UIView.animate(withDuration: 0.5, delay: 0,
                       options: [.allowUserInteraction],
                       animations: {
                        noInternetConnectionView.frame.origin.y = ICCHelper.getNoInternetViewHeight()
        }, completion: { _ in
            self.remove(view: noInternetConnectionView)
        })
    }
    
    private func remove(view: UIView) {
        view.removeFromSuperview()
        isNoInternetViewShown = false
    }
    
}
