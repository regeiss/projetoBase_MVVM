//
//  NetworkReach.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 13/04/22.
//

import Foundation
import SystemConfiguration

class NetworkReachability: ObservableObject
{
    @Published private(set) var reachable: Bool = false
    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.designcode.io")

    init()
    {
        self.reachable = checkConnection()
    }

    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool
    {
        let isReachable = flags.contains(.reachable)
        let connectionRequired = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutIntervention = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!connectionRequired || canConnectWithoutIntervention)
    }

    func checkConnection() -> Bool
    {
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)

        return isNetworkReachable(with: flags)
    }
}

// ContentView.swift

//struct ContentView: View {
//    let networkReachability = NetworkReachability()
//
//    var body: some View {
//        Text("Is the network reachable? \(networkReachability.reachable)" as String)
//            .padding()
//    }
//}
