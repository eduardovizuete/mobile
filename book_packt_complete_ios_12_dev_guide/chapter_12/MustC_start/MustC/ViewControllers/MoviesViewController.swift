import UIKit
import CoreData

class MoviesViewController: UIViewController, AddMovieDelegate {
  
  @IBOutlet var tableView: UITableView!
  
  var persistentContainer: NSPersistentContainer!
  
  var familyMember: FamilyMember?
  
  func saveMovie(withName name: String) {
    guard let familyMember = self.familyMember
      else { return }
    
    let moc = persistentContainer.viewContext
    
    moc.perform {
      let movie = Movie(context: moc)
      movie.title = name
      
      let newFavorites: Set<AnyHashable> = familyMember.movies?.adding(movie) ?? [movie]
      
      familyMember.movies = NSSet(set: newFavorites)
      
      do {
        try moc.save()
      } catch {
        moc.rollback()
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let navVC = segue.destination as? UINavigationController,
      let addMovieVC = navVC.viewControllers[0] as? AddMovieViewController {
      
      addMovieVC.delegate = self
    }
  }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
      else { fatalError("Wrong cell identifier requested") }
    
    return cell
  }
}
