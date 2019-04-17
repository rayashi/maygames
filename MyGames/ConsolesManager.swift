import  CoreData

class ConsolesManager {
    static let shared = ConsolesManager()
    
    var consoles: [Console] = []
    
    private init() {
        
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        context.delete(consoles[index])
        do {
            try context.save()
        } catch {
            print("Error trying deleting console index \(index)")
        }
    }
    
    
    func loadConsoles(with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        consoles = try! context.fetch(fetchRequest) 
    }
}
