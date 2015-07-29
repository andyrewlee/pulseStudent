//
//  ViewController.swift
//  pulseiOS
//
//  Created by Jae Hoon Lee on 7/28/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let socket = SocketIOClient(socketURL: "https://pacific-lake-4955.herokuapp.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        socket.connect()
        
        socket.on("connect") { data, ack in
            print("iOS::WE ARE USING SOCKETS")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func voteButtonPressed(sender: UIButton) {
        print(sender.tag)
        print(UIDevice.currentDevice().identifierForVendor!.UUIDString)
        socket.emit("arrowPressed", sender.tag, UIDevice.currentDevice().identifierForVendor!.UUIDString)
    }

}

