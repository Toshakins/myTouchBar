//
//  MyHostingController.swift
//  myTouchBar
//
//  Created by ao on 13.04.2020.
//  Copyright © 2020 ao. All rights reserved.
//

import Cocoa
import SwiftUI

class MyHostingController: NSHostingController<AnyView> {
    override init(rootView: AnyView) {
        super.init(rootView: rootView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: AnyView(ContentView()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("trololo")
    }

}
