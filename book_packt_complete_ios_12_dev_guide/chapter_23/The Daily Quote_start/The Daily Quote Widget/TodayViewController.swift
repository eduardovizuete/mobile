//
//  TodayViewController.swift
//  The Daily Quote Widget
//
//  Created by eduardo on 5/22/19.
//  Copyright © 2019 Donny Wals. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
  
  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var quoteCreator: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateWidget()
  }
  
  func updateWidget() {
    let quote = Quote.current
    quoteLabel.text = quote.text
    quoteCreator.text = quote.creator
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    let currentText = quoteLabel.text
    updateWidget()
    let newText = quoteLabel.text
    
    if currentText == newText {
      completionHandler(NCUpdateResult.noData)
    } else {
      completionHandler(NCUpdateResult.newData)
    }
    
    extensionContext?.widgetLargestAvailableDisplayMode = .expanded
  }
  
  func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
    if activeDisplayMode == .compact {
      preferredContentSize = maxSize
    } else {
      preferredContentSize = CGSize(width: maxSize.width, height: 200)
    }
  }
  
}
