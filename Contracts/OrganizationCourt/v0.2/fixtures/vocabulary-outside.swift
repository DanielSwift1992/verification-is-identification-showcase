public enum Drawing: Structure {
    @StructureBuilder
    public static var body: some Structure {
        Canvas.self
        Picture<Canvas, Ink>.self
    }
}
