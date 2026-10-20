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
    public static var typeName: String { "Dictionary/Basics.swift" }
}

public enum ThePages: Mine {
    public typealias Kind = CarriedFile
}
extension ThePages {
    public static var typeName: String { "BasicsPages.swift" }
}

// The drawing profile is an input shared with the other worlds.
public protocol Theirs {}
public enum DrawingProfileFile: Role {}
public enum TheDrawing: Theirs {
    public typealias Kind = DrawingProfileFile
}
extension TheDrawing {
    public static var typeName: String { "../Site/DrawingProfile.swift" }
}
