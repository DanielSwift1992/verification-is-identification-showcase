import VerificationIsIdentification
import DocumentKit

public enum TitleRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<WorldTitleLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum SubRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, WorldSubLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SubTwoRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, WorldSubTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum LampLessonRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, LampLessonLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum PinLessonRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, PinLessonLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum PinHeadRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<PinHeading>.self
        Air<EdgeMargin>.self
    }
}
public enum SecretRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<SecretLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum TryRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, TryLineLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SubThreeRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, WorldSubThreeLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum LampMechRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, LampMechLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum PinChordRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, PinChordParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum SecretHintRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, SecretHintLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TryTwoRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, TryTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum CountLessonRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<ButtonsParaWide, CountLessonLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum CountRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Air<DotSlot>.self
        Air<U8>.self
        Fixed<U64, CountCaption>.self
        Air<U8>.self
        Flexible<CountNumber>.self
        Fixed<KeySide, RuleKey<BumpUp<Count>, PlusOneKey>>.self
        Air<EdgeMargin>.self
    }
}
public enum LampRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<DotSlot, LampDot>.self
        Air<U8>.self
        Fixed<U64, LampCaption>.self
        Air<U8>.self
        Flexible<LampTerm>.self
        Fixed<KeySide, RuleKey<PowerOn, OnKey>>.self
        Air<U8>.self
        Fixed<KeySide, RuleKey<PowerOff, OffKey>>.self
        Air<EdgeMargin>.self
    }
}
public enum PinDotsRow: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Flexible<SpanNothing>.self
        Fixed<DotSlot, PinDotOne>.self
        Air<U8>.self
        Fixed<DotSlot, PinDotTwo>.self
        Air<U8>.self
        Fixed<DotSlot, PinDotThree>.self
        Air<U8>.self
        Fixed<DotSlot, PinDotFour>.self
        Flexible<SpanNothing>.self
    }
}
public enum PadRowOne: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Flexible<SpanNothing>.self
        Fixed<PadSide, RuleKey<OneChord, Layered<PadKeyFace, DigitOneLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<TwoChord, Layered<PadKeyFace, DigitTwoLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<ThreeChord, Layered<PadKeyFace, DigitThreeLabel>>>.self
        Flexible<SpanNothing>.self
    }
}
public enum PadRowTwo: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Flexible<SpanNothing>.self
        Fixed<PadSide, RuleKey<FourChord, Layered<PadKeyFace, DigitFourLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<FiveChord, Layered<PadKeyFace, DigitFiveLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<SixChord, Layered<PadKeyFace, DigitSixLabel>>>.self
        Flexible<SpanNothing>.self
    }
}
public enum PadRowThree: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Flexible<SpanNothing>.self
        Fixed<PadSide, RuleKey<SevenChord, Layered<PadKeyFace, DigitSevenLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<EightChord, Layered<PadKeyFace, DigitEightLabel>>>.self
        Air<U16>.self
        Fixed<PadSide, RuleKey<NineChord, Layered<PadKeyFace, DigitNineLabel>>>.self
        Flexible<SpanNothing>.self
    }
}
public enum PadRowZero: HFlow {
    public typealias Given = WorldSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Flexible<SpanNothing>.self
        Fixed<PadSide, RuleKey<ZeroChord, Layered<PadKeyFace, DigitZeroLabel>>>.self
        Flexible<SpanNothing>.self
    }
}

public enum WorldArt: GrownDiagram {
    public typealias Across = WorldSurface
    public typealias AriaLabel = WorldAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<Plus<U32, U8>, SpanHosted<TitleRow>>.self
        Fixed<WorldSubTall, SpanHosted<SubRow>>.self
        Fixed<WorldSubTwoTall, SpanHosted<SubTwoRow>>.self
        Fixed<WorldSubThreeTall, SpanHosted<SubThreeRow>>.self
        Air<Plus<U8, U4>>.self
        Fixed<LampLessonTall, SpanHosted<LampLessonRow>>.self
        Air<U8>.self
        Fixed<TrackHeight, SpanHosted<LampRow>>.self
        Air<U8>.self
        Fixed<LampMechTall, SpanHosted<LampMechRow>>.self
        Air<Breath>.self
        Fixed<CountLessonTall, SpanHosted<CountLessonRow>>.self
        Air<U8>.self
        Fixed<TrackHeight, SpanHosted<CountRow>>.self
        Air<Breath>.self
        Fixed<PinLessonTall, SpanHosted<PinLessonRow>>.self
        Fixed<PinChordParaTall, SpanHosted<PinChordRow>>.self
        Air<U8>.self
        Fixed<Plus<U16, U4>, SpanHosted<PinHeadRow>>.self
        Air<U8>.self
        Fixed<U16, SpanHosted<PinDotsRow>>.self
        Air<Plus<U8, U4>>.self
        Fixed<PadSide, SpanHosted<PadRowOne>>.self
        Air<U8>.self
        Fixed<PadSide, SpanHosted<PadRowTwo>>.self
        Air<U8>.self
        Fixed<PadSide, SpanHosted<PadRowThree>>.self
        Air<U8>.self
        Fixed<PadSide, SpanHosted<PadRowZero>>.self
        Air<U8>.self
        Fixed<SecretHintTall, SpanHosted<SecretHintRow>>.self
        Fixed<Plus<U16, U4>, SpanHosted<SecretRow>>.self

        Air<Plus<U16, U8>>.self
        Fixed<TryLineTall, SpanHosted<TryRow>>.self
        Fixed<TryTwoTall, SpanHosted<TryTwoRow>>.self
        Air<EdgeMargin>.self
    }
}
