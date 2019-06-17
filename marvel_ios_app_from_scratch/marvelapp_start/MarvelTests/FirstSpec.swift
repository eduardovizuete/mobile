//
//  FirstSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/17/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Pods_marvelapp_start

class FirstSpec: QuickSpec {
  override func spec() {
    describe("First Simple Spec") {
      
      it("should be true") {
        expect(true).to(beTruthy())
      }
      
    }
  }
}
