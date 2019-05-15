//
//  NSManagedObjectContext.swift
//  MustC
//
//  Created by eduardo on 5/15/19.
//

import CoreData

extension NSManagedObjectContext {
  func persist(block: @escaping () -> Void) {
    perform {
      block()
      
      do {
        try self.save()
      } catch {
        self.rollback()
      }
    }
  }
}
