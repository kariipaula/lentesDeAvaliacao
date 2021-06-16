

import Foundation

var lenses: [LensCard] = load("lenses")

func load<T: Decodable>(_ filename: String, withExtension: String = "json", usesLocale: Bool = true) -> T {
    let data: Data

    let completeFileName: String
    if usesLocale, let languageCode = Locale.current.languageCode {
        completeFileName = "\(filename)_\(languageCode)"
    } else {
        completeFileName = filename
    }
    
    guard let file = Bundle.main.url(forResource: completeFileName, withExtension: withExtension)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
