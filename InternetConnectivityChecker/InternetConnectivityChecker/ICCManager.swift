import Foundation
import ReachabilitySwift

class ICCManager: NSObject {
    
    static  let shared = ICCManager()
    
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .notReachable
    }
    
    private var reachabilityStatus: Reachability.NetworkStatus = .notReachable
    private let reachability = Reachability()!
    
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        reachabilityStatus = reachability.currentReachabilityStatus
        updateInternetConnectivity()
    }
    
    private func updateInternetConnectivity() {
        switch reachabilityStatus {
        case .notReachable:
            ICCViewHandler.shared.showNoInternetView()
        default:
            ICCViewHandler.shared.hideNoInternetConnectionView()
        }
    }
    
    func startMonitoring() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.reachabilityChanged),
                         name: ReachabilityChangedNotification,
                         object: reachability)
        do{
            try reachability.startNotifier()
            
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: ReachabilityChangedNotification,
                                                  object: reachability)
    }
    
}

