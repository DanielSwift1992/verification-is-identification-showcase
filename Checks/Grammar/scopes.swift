// Source paths and dialects belong to the showcase. vi owns the reader and grants.
public enum GrammarScopes {
    public static let format = "vi-scope-map/1"
    public static let entries: [(String, String)] = [
        ("Worlds/Playground/Organization/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Scale/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Typewriter/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Basics/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/ReadMe/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Light/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Rules/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/World/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/Atom/Dictionary", "SurfaceScope"),
        ("Worlds/Playground/FAQ/Dictionary", "SurfaceScope"),
        ("Sources/Organization/System", "SystemScope"),
        ("Sources/Organization/Query", "SystemScope"),
        ("Sources/Organization/View", "SurfaceScope"),
        ("Sources/DocumentKitDemo", "DemoScope"),
        ("Worlds/Playground/Site", "SurfaceScope"),
        ("Sources/ShowcaseTools", "ToolsScope"),
        ("Sources/DynamicsDemo", "DemoScope"),
        ("Sources/OrgWalkPages", "DemoScope"),
        ("Sources/Organization", "SystemScope"),
        ("Sources/DocumentKit", "SurfaceScope"),
        ("Sources/VectorDemo", "DemoScope"),
        ("Worlds/Playground", "DemoScope"),
        ("Sources/OrgDemo", "DemoScope"),
        ("Sources/Court", "ToolsScope"),
        ("Plugins", "ToolsScope"),
    ]
}
