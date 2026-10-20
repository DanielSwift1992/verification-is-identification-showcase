public enum Access: Structure {
    @StructureBuilder
    public static var body: some Structure {
        VerifiedInDepartment<Alice, Finance>.self
    }
}
