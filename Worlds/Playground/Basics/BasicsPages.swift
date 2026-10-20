import VerificationIsIdentification
import DocumentKit

public enum TitleRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<TitleLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum BasicsPurposeRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, BasicsPurposeLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum StepOneRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, StepOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum BannerRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<Layered<BannerFace, GreetingLabel>>.self
        Air<EdgeMargin>.self
    }
}
public enum StepTwoRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, StepTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum CardsRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<Layered<QuietCard, PlansLabel>>.self
        Air<U8>.self
        Flexible<Layered<HeroCard, BuildsLabel>>.self
        Air<U8>.self
        Flexible<Layered<QuietCard, ProofsLabel>>.self
        Air<EdgeMargin>.self
    }
}
public enum StepThreeRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, StepThreeLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum DotsRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<Plus<U128, U64>>.self
        Flexible<FooterDot>.self
        Flexible<FooterDot>.self
        Flexible<FooterDot>.self
        Air<Plus<U128, U64>>.self
    }
}
public enum StepFourRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, StepFourLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum StepFourNoteRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, StepFourNoteLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum StageRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<StageFace>.self
        Air<EdgeMargin>.self
    }
}
public enum WroteRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<WroteLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum CheckedRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<CheckedLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum ProvedRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<ProvedLabel>.self
        Air<EdgeMargin>.self
    }
}
// the schedule: the first word at 0 s for 2 s, the second at 2 s, the third stays
public enum FilmContent: Group {
    @StructureBuilder
    public static var body: some Structure {
        StageRow.self
        TimedReveal<Tally<Never>, Tally<U2>, WroteRow>.self
        TimedReveal<Tally<U2>, Tally<U2>, CheckedRow>.self
        FrozenReveal<Tally<U4>, ProvedRow>.self
    }
}
public enum FinalRow: HFlow {
    public typealias Given = BasicsSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<BasicsParaWide, FinalLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}

public enum BasicsArt: GrownDiagram {
    public typealias Across = BasicsSurface
    public typealias AriaLabel = BasicsAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<TitleTall, SpanHosted<TitleRow>>.self
        Fixed<BasicsPurposeTall, SpanHosted<BasicsPurposeRow>>.self
        Air<U8>.self
        Fixed<StepOneTall, SpanHosted<StepOneRow>>.self
        Air<U8>.self
        Fixed<BannerTall, SpanHosted<BannerRow>>.self
        Air<Plus<U16, U8>>.self
        Fixed<StepTwoTall, SpanHosted<StepTwoRow>>.self
        Air<U8>.self
        Fixed<CardTall, SpanHosted<CardsRow>>.self
        Air<Plus<U16, U8>>.self
        Fixed<StepThreeTall, SpanHosted<StepThreeRow>>.self
        Air<Plus<U8, U4>>.self
        Fixed<DotsTall, SpanHosted<DotsRow>>.self
        Air<Plus<U16, U8>>.self
        Fixed<StepFourTall, SpanHosted<StepFourRow>>.self
        Fixed<StepFourNoteTall, SpanHosted<StepFourNoteRow>>.self
        Air<U8>.self
        Fixed<StageTall, SpanHosted<FilmContent>>.self
        Air<Plus<U16, U8>>.self
        Fixed<FinalTall, SpanHosted<FinalRow>>.self
        Air<EdgeMargin>.self
    }
}
