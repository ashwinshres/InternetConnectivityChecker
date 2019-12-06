import UIKit

class ICCHelper {
    
    static func getAppWindow() -> UIWindow? {
        return ICCHelper.getAppDelegate()?.window
    }
    
    static func getAppDelegate() -> AppDelegate? {
        return (UIApplication.shared.delegate as? AppDelegate)
    }
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var topSafeAreaInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            // Fallback on earlier versions
            return UIApplication.shared.keyWindow?.rootViewController?.topLayoutGuide.length ?? 0
        }
    }
    
    static func getNoInternetViewHeight() -> CGFloat {
        return ICCHelper.getScreenHeight()
    }
    
}

