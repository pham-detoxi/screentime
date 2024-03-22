import Foundation
import Capacitor
import SwiftUI
import DeviceActivity
import FamilyControls
import UIKit
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */

@available(iOS 16.0, *)
struct ChartView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss // EnvironmentValue
    
    
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
        segment: .weekly(
            during: Calendar.current.dateInterval(
                of: .weekOfYear,
                for: Date()
            )!
        ),
        users: .all,
        devices: .init([.iPhone, .iPad])
    )
    
    var body: some View {
        ZStack {
            DeviceActivityReport(context, filter: filter)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {dismiss()})
                    {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0, green: 0.58, blue: 0.56).opacity(0.3))
                    }
                    .padding(8) // Optional padding for the button
                }
                Spacer()
            }
            
        }
    }
}



class MyViewController: CAPBridgeViewController {
    // additional code
}





@available(iOS 16.0, *)
@objc(ScreenTimeActivityPlugin)
public class ScreenTimeActivityPlugin: CAPPlugin {
    private let implementation = ScreenTimeActivity()
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? "..."
        Task{
            let center = AuthorizationCenter.shared
            
            do {
                print("asfasfgasgfasfasasds")
                try await center.requestAuthorization(for: FamilyControlsMember.individual)
            } catch {
                // Handle the error here.
            }
            
            call.resolve([
                "value": implementation.echo(value)
            ])
        }
    }
    
    @objc func showReport(_ call: CAPPluginCall) {
        //        let message = call.getString("message") ?? ""
        //        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        //        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        
        Task{
            try await AuthorizationCenter.shared.requestAuthorization(for: FamilyControlsMember.individual)
            print("done")
            
            
            
            DispatchQueue.main.async {
                let vc = UIHostingController(rootView: ChartView())
                
                //            vc.modalPresentationStyle = .fullScreen
                
                self.bridge?.viewController?.present(vc, animated: true, completion: nil)
            }
            
            
            call.resolve([
                "value": ""
            ])
        }
        
    }
    
    @objc func checkPermission(_ call: CAPPluginCall) {
        Task{
            //                await request()
            let isNotDetermined = AuthorizationCenter.shared.authorizationStatus == .notDetermined
            
            if(isNotDetermined){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    let hasPermission = AuthorizationCenter.shared.authorizationStatus == .approved
                    
                    print(hasPermission)
                    
                    call.resolve([
                        "value": hasPermission])
                }
            }else{
                let hasPermission = AuthorizationCenter.shared.authorizationStatus == .approved
                
                print(hasPermission)
                
                call.resolve([
                    "value": hasPermission])
            }
            
            
            
        }
        
    }
}
