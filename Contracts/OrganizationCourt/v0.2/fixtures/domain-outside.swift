public protocol Asset {
    associatedtype Unit: Measure
}
public enum Stock: Asset {
    public typealias Unit = ExternalUnit
}
