//
//  Movie.swift
//  MustC
//
//  Created by eduardo on 5/17/19.
//

import CoreData

extension Movie {
  static func find(byName name: String, orCreateIn moc: NSManagedObjectContext) -> Movie {
    let predicate = NSPredicate(format: "title ==[dc] %@", name)
    let request: NSFetchRequest<Movie> = Movie.fetchRequest()
    request.predicate = predicate
    
    guard let result = try? moc.fetch(request)
      else { return Movie(context: moc) }
    
    return result.first ?? Movie(context: moc)
  }
}
