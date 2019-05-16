import UIKit
import CoreData

class MoviesViewController: UIViewController, AddMovieDelegate, PersistenContainerRequiring {
  
  @IBOutlet var tableView: UITableView!
  
  var persistentContainer: NSPersistentContainer!
  
  var familyMember: FamilyMember?
  
  func saveMovie(withName name: String) {
    guard let familyMember = self.familyMember
      else { return }
    
    let moc = persistentContainer.viewContext
    
    moc.persist {
      let movie = Movie(context: moc)
      movie.title = name
      let newFavorites: Set<AnyHashable> = familyMember.movies?.adding(movie) ?? [movie]      
      familyMember.movies = NSSet(set: newFavorites)
      
      let helper = MovieDBHelper()
      helper.fetchRating(forMovie: name) { rating in
        guard let rating = rating
          else { return }
        
        moc.persist {
          movie.popularity = rating
        }
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.managedObjectContextDidChange(notification:)),
      name: .NSManagedObjectContextObjectsDidChange,
      object: nil)
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
    return familyMember?.movies?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell"),
      let movies = familyMember?.movies
      else { fatalError("Wrong cell identifier requested") }
    
    let moviesArray = Array(movies as! Set<Movie>)
    let movie = moviesArray[indexPath.row]
    cell.textLabel?.text = movie.title
    cell.detailTextLabel?.text = "Rating: \(movie.popularity)"
    
    return cell
  }
}

extension MoviesViewController {
  @objc func managedObjectContextDidChange(notification: NSNotification) {
    guard let userInfo = notification.userInfo
      else { return }
    
    if let updateObjects = userInfo[NSUpdatedObjectsKey] as? Set<FamilyMember>,
      let familyMember = self.familyMember,
      updateObjects.contains(familyMember) {
        tableView.reloadData()
    }
    
    if let updateObjects  = userInfo[NSUpdatedObjectsKey] as? Set<Movie> {
      for object in updateObjects {
        if object.familyMember == familyMember {
          tableView.reloadData()
          break
        }
      }
    }
  }
}
