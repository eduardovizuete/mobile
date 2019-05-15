import UIKit
import CoreData

class FamilyMembersViewController: UIViewController, AddFamilyMemberDelegate, PersistenContainerRequiring {
  
  @IBOutlet var tableView: UITableView!
  
  var persistentContainer: NSPersistentContainer!
  
  var familyMembers = [FamilyMember]()
  
  func saveFamilyMember(withName name: String) {
    let moc = persistentContainer.viewContext
    
    moc.persist {
      let familyMember = FamilyMember(context: moc)
      familyMember.name = name
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let request: NSFetchRequest<FamilyMember> = FamilyMember.fetchRequest()
    let moc = persistentContainer.viewContext
    
    guard  let results = try? moc.fetch(request) else {
      return
    }
    familyMembers = results
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let navVC = segue.destination as? UINavigationController,
      let addFamilyMemberVC = navVC.viewControllers[0] as? AddFamilyMemberViewController {
        addFamilyMemberVC.delegate = self
    }
    
    guard let selectedIndex = tableView.indexPathForSelectedRow
      else { return }
    
    tableView.deselectRow(at: selectedIndex, animated: true)
    
    if let moviesVC = segue.destination as? MoviesViewController {
      moviesVC.persistentContainer = persistentContainer
      moviesVC.familyMember = familyMembers[selectedIndex.row]
    }
  }
  
}

extension FamilyMembersViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return familyMembers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberCell")
      else { fatalError("Wrong cell identifier requested") }
    
    let familyMember = familyMembers[indexPath.row]
    cell.textLabel?.text = familyMember.name
    return cell
  }
}
