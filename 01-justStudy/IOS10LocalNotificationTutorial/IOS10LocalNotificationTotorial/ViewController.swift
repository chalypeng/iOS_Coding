//
//  ViewController.swift
//  IOS10LocalNotificationTotorial
//
//  Created by chalypeng on 17/1/5.
//  Copyright © 2017年 chalypeng. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 通知用户授权通知权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendNotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from chalypeng"
        content.body = "Notification triggered"

        let imageName = "applelogo"
        guard let imageUrl = Bundle.main.url(forResource: imageName, withExtension: "png") else {
            return
        }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageUrl, options: .none)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }


}

