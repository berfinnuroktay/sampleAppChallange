import Foundation

/// Simple JSON cache which is saved as file.
/// Stores thelast-fetched hierarchy
enum Cache {

    private static let filename = "hierarchy.json"
    private static var cachesURL: URL? {
            FileManager.default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(filename)
        }

    static func save<T: Encodable>(_ model: T) {
        guard let url = cachesURL else { return }

        do {
            let data = try JSONEncoder().encode(model)
            try data.write(to: url, options: .atomic)
        } catch {
            print("=== Error: Cache save failed", error)
        }
    }

    static func saveIfNew<T: Codable & Equatable>(_ model: T) {
        if let old: T = load(T.self), old == model {
            return
        }
        save(model)
    }

    static func load<T: Decodable>(_ type: T.Type) -> T? {
        guard let url = cachesURL,
              let data = try? Data(contentsOf: url)
        else {
            return nil
        }

        return try? JSONDecoder().decode(T.self, from: data)
    }
}
