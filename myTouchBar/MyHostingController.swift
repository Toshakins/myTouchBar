//
//  MyHostingController.swift
//  myTouchBar
//
//  Created by ao on 13.04.2020.
//  Copyright © 2020 ao. All rights reserved.
//

import Cocoa
import SwiftUI

class MyHostingController: NSHostingController<AnyView>, NSTouchBarDelegate {
    let label = NSTouchBarItem.Identifier("com.TouchBarCatalog.TouchBarItem.label")

    override init(rootView: AnyView) {
        super.init(rootView: rootView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: AnyView(ContentView()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier =
            NSTouchBar.CustomizationIdentifier("com.TouchBarCatalog.windowTouchBar")
        touchBar.defaultItemIdentifiers = [label]
        return touchBar
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        print("touchy touch")
        let custom = NSCustomTouchBarItem(identifier: identifier)
        let label = NSTextField(labelWithString: NSLocalizedString("Catalog", comment: ""))
        custom.view = label
        return custom
    }

}
