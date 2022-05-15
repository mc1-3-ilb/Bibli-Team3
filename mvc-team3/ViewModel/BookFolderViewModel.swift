import CoreData

class BookFolderViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [BookEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "BookContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }else{
                print("success")
            }
        }
        fetchBooks()
    }
    
    func fetchBooks() {
        let request = NSFetchRequest<BookEntity>(entityName: "BookEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addBook(title: String, author: String) {
        let newBook = BookEntity(context: container.viewContext)
        newBook.titleBook = title
        newBook.authorBook =  author
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchBooks()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
