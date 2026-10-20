// Declarations are read by where/count; page bodies are compiled by SwiftPM.
// CarriedFile accounts for our page source without sending it to the company court.
public protocol Role {}
public enum FormsFile: Role {}
public enum CarriedFile: Role {}
public protocol Mine {}

public enum TheDeclarations: Mine {
    public typealias Kind = FormsFile
}
extension TheDeclarations {
    public static var typeName: String { "Dictionary/Light.swift" }
}

public enum ThePages: Mine {
    public typealias Kind = CarriedFile
}
extension ThePages {
    public static var typeName: String { "LightPages.swift" }
}
