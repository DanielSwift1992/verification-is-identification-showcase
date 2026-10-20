import VerificationIsIdentification
import DocumentKit

public enum HeadRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<Layered<TitleLabel, SubLabel>>.self
        Air<EdgeMargin>.self
    }
}
public enum EntryOneTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QOneLabel, AOneParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntryOneBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardOneRow.self
        EntryOneTextRow.self
    }
}
public enum EntryTwoTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QTwoLabel, ATwoParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntryTwoBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardTwoRow.self
        EntryTwoTextRow.self
    }
}
public enum EntryThreeTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QThreeLabel, AThreeParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntryThreeBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardThreeRow.self
        EntryThreeTextRow.self
    }
}
public enum EntryFourTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QFourLabel, AFourParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntryFourBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardFourRow.self
        EntryFourTextRow.self
    }
}
public enum EntryFiveTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QFiveLabel, AFiveParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntryFiveBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardFiveRow.self
        EntryFiveTextRow.self
    }
}
public enum EntrySixTextRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Fixed<FaqTextWide, Layered<QSixLabel, ASixParaText>>.self
        Flexible<SpanNothing>.self
        Air<InnerMargin>.self
    }
}
public enum EntrySixBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FaqCardSixRow.self
        EntrySixTextRow.self
    }
}

public enum FaqCardOneRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardOne>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqCardTwoRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardTwo>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqCardThreeRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardThree>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqCardFourRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardFour>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqCardFiveRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardFive>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqCardSixRow: HFlow {
    public typealias Given = FAQSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FaqCardSix>.self
        Air<EdgeMargin>.self
    }
}
public enum FaqArt: GrownDiagram {
    public typealias Across = FAQSurface
    public typealias AriaLabel = FaqAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<HeadTall, SpanHosted<HeadRow>>.self
        Air<U16>.self
        Fixed<FaqOneTall, SpanHosted<EntryOneBand>>.self
        Air<U8>.self
        Fixed<FaqTwoTall, SpanHosted<EntryTwoBand>>.self
        Air<U8>.self
        Fixed<FaqThreeTall, SpanHosted<EntryThreeBand>>.self
        Air<U8>.self
        Fixed<FaqFourTall, SpanHosted<EntryFourBand>>.self
        Air<U8>.self
        Fixed<FaqFiveTall, SpanHosted<EntryFiveBand>>.self
        Air<U8>.self
        Fixed<FaqSixTall, SpanHosted<EntrySixBand>>.self
        Air<EdgeMargin>.self
    }
}
