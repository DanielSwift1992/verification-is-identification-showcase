import VerificationIsIdentification
import DocumentKit

public enum SheetInnerRow: HFlow {
    public typealias Given = SheetWide
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<SheetText>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetTitleRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<SheetTitleLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetSubRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, SheetSubLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetSubTwoRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, SheetSubTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetSubThreeRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, SheetSubThreeLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetSubFourRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, SheetSubFourLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SheetRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<Layered<SheetFace, SpanHosted<SheetInnerRow>>>.self
        Air<EdgeMargin>.self
    }
}
public enum TrySheetRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, TrySheetLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TrySheetTwoRow: HFlow {
    public typealias Given = TypewriterSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<TypewriterParaWide, TrySheetTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}

public enum SheetArt: GrownDiagram {
    public typealias Across = TypewriterSurface
    public typealias AriaLabel = SheetAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<Plus<U32, U8>, SpanHosted<SheetTitleRow>>.self
        Fixed<SheetSubTall, SpanHosted<SheetSubRow>>.self
        Fixed<SheetSubTwoTall, SpanHosted<SheetSubTwoRow>>.self
        Fixed<SheetSubThreeTall, SpanHosted<SheetSubThreeRow>>.self
        Fixed<SheetSubFourTall, SpanHosted<SheetSubFourRow>>.self
        Air<Plus<U16, U8>>.self
        Fixed<SheetTall, SpanHosted<SheetRow>>.self
        Air<Plus<U16, U8>>.self
        Fixed<TrySheetTall, SpanHosted<TrySheetRow>>.self
        Fixed<TrySheetTwoTall, SpanHosted<TrySheetTwoRow>>.self
        Air<EdgeMargin>.self
    }
}
