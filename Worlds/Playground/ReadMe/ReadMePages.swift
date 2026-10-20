import VerificationIsIdentification
import DocumentKit

public enum TitleRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<TitleLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum CurveHeadRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<CurveHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum LegendRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<U8, BuildDot>.self
        Air<U4>.self
        Fixed<Plus<U128, U64>, BuildLegendLabel>.self
        Air<U8>.self
        Fixed<U8, JudgeDot>.self
        Air<U4>.self
        Flexible<JudgeLegendLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum Build3200Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<NColumn, N3200Label>.self
        Fixed<Build3200W, BuildBar>.self
        Air<U8>.self
        Flexible<Build3200Label>.self
        Air<EdgeMargin>.self
    }
}
public enum Judge3200Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Air<NColumn>.self
        Fixed<U2, JudgeBar>.self
        Air<U8>.self
        Flexible<Judge3200Label>.self
        Air<EdgeMargin>.self
    }
}
public enum Build6400Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<NColumn, N6400Label>.self
        Fixed<Build6400W, BuildBar>.self
        Air<U8>.self
        Flexible<Build6400Label>.self
        Air<EdgeMargin>.self
    }
}
public enum Judge6400Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Air<NColumn>.self
        Fixed<U2, JudgeBar>.self
        Air<U8>.self
        Flexible<Judge6400Label>.self
        Air<EdgeMargin>.self
    }
}
public enum Build12800Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<NColumn, N12800Label>.self
        Fixed<Build12800W, BuildBar>.self
        Air<U8>.self
        Flexible<Build12800Label>.self
        Air<EdgeMargin>.self
    }
}
public enum Judge12800Row: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Air<NColumn>.self
        Fixed<U2, JudgeBar>.self
        Air<U8>.self
        Flexible<Judge12800Label>.self
        Air<EdgeMargin>.self
    }
}
public enum MoralRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, MoralLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum CurveNoteOneRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, CurveNoteOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum CurveNoteTwoRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, CurveNoteTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum ExplainHeadRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<ExplainHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum ExplainOneRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, ExplainOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TimelineRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<BuildZone>.self
        Flexible<RunZone>.self
        Air<EdgeMargin>.self
    }
}
public enum BuildTextRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<BuildHeadLabel, Layered<BuildOneLabel, Layered<BuildTwoLabel, BuildThreeLabel>>>>.self
        Air<FarColumn>.self
    }
}
public enum RunTextRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<ReadMePanelOffset>.self
        Flexible<Layered<RunHeadLabel, Layered<RunOneLabel, Layered<RunTwoLabel, RunThreeLabel>>>>.self
        Air<Plus<U32, U16>>.self
    }
}
public enum TimelineBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        TimelineRow.self
        BuildTextRow.self
        RunTextRow.self
    }
}
public enum ReadingsHeadRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<ReadingsHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum ReadingsIntroRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, ReadingsIntroLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum PanelHeadRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<CellPad>.self
        Fixed<CodeCol, CodeHeadLabel>.self
        Air<U64>.self
        Flexible<TableHeadLabel>.self
        Air<CellPad>.self
    }
}
public enum PairOneRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<CellPad>.self
        Fixed<CodeCol, CodeOneLabel>.self
        Air<PanelGap>.self
        Air<ColGap>.self
        Fixed<ColName, TableColNameLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColRank, TableColRankLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColHome, TableColHomeLabel>.self
        Air<ColGap>.self
        Flexible<SpanNothing>.self
    }
}
public enum PairTwoChips: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<LineChipW, HighlightChip>.self
        Air<CellPad>.self
        Air<Plus<U32, Plus<U16, U8>>>.self
        Air<Plus<U64, U16>>.self
        Fixed<Plus<U64, U16>, HighlightChip>.self
        Flexible<SpanNothing>.self
    }
}
public enum PairTwoText: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<CellPad>.self
        Fixed<CodeCol, CodeTwoLabel>.self
        Air<PanelGap>.self
        Air<ColGap>.self
        Fixed<ColName, RowOneNameLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColRank, RowOneRankLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColHome, RowOneHomeLabel>.self
        Air<ColGap>.self
        Flexible<SpanNothing>.self
    }
}
public enum PairTwoBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        PairTwoChips.self
        PairTwoText.self
    }
}
public enum PairThreeRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<CellPad>.self
        Fixed<CodeCol, CodeThreeLabel>.self
        Air<PanelGap>.self
        Air<ColGap>.self
        Fixed<ColName, RowTwoNameLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColRank, RowTwoRankLabel>.self
        Air<ColGap>.self
        Air<ColGap>.self
        Fixed<ColHome, RowTwoHomeLabel>.self
        Air<ColGap>.self
        Flexible<SpanNothing>.self
    }
}
public enum ReadingsBreakRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, ReadingsBreakLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TryTwoRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TryTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}

public enum SwiftParaRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, SwiftParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum PageBuildParaRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, PageBuildParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum ReadingsMoralParaRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, ReadingsMoralParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TryLieParaRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TryLieParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabsHeadRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<TabsHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum TabOrgRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabOrgLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabScaleRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabScaleLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabBasicsRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabBasicsLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabWriterRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabWriterLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabButtonsRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabButtonsLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabLightRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabLightLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabAtomRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabAtomLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum TabRulesRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, TabRulesLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum ValueParaRow: HFlow {
    public typealias Given = ReadMeSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<IntroParaWide, ValueParaText>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum IntroArt: GrownDiagram {
    public typealias Across = ReadMeSurface
    public typealias AriaLabel = IntroAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<HeadTall, SpanHosted<TitleRow>>.self
        Fixed<ValueTall, SpanHosted<ValueParaRow>>.self

        Air<Plus<U16, U8>>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<FourthBeat, IntroTicksPerSecond>, CurveHeadRow>>>.self
        Air<U8>.self
        Fixed<LegendTall, SpanHosted<FrozenReveal<Seconds<FourthBeat, IntroTicksPerSecond>, LegendRow>>>.self
        Air<U16>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<FifthBeat, IntroTicksPerSecond>, Build3200Row>>>.self
        Air<U4>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<FifthBeat, IntroTicksPerSecond>, Judge3200Row>>>.self
        Air<U8>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<SixthBeat, IntroTicksPerSecond>, Build6400Row>>>.self
        Air<U4>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<SixthBeat, IntroTicksPerSecond>, Judge6400Row>>>.self
        Air<U8>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<SeventhBeat, IntroTicksPerSecond>, Build12800Row>>>.self
        Air<U4>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<SeventhBeat, IntroTicksPerSecond>, Judge12800Row>>>.self
        Air<U8>.self
        Fixed<CurveMoralTall, SpanHosted<FrozenReveal<Seconds<IntroTicksPerSecond, IntroTicksPerSecond>, MoralRow>>>.self
        Air<U4>.self
        Fixed<CurveNoteOneTall, SpanHosted<FrozenReveal<Seconds<IntroTicksPerSecond, IntroTicksPerSecond>, CurveNoteOneRow>>>.self
        Fixed<CurveNoteTwoTall, SpanHosted<FrozenReveal<Seconds<IntroTicksPerSecond, IntroTicksPerSecond>, CurveNoteTwoRow>>>.self
        Air<Plus<U16, U8>>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<Plus<IntroTicksPerSecond, Beat>, IntroTicksPerSecond>, ExplainHeadRow>>>.self
        Fixed<ExplainOneTall, SpanHosted<FrozenReveal<Seconds<Plus<IntroTicksPerSecond, Beat>, IntroTicksPerSecond>, ExplainOneRow>>>.self
        Air<U8>.self
        Fixed<CompareTall, SpanHosted<FrozenReveal<Seconds<Plus<IntroTicksPerSecond, Beat>, IntroTicksPerSecond>, TimelineBand>>>.self
        Air<Plus<U8, U4>>.self
        Fixed<SwiftTall, SpanHosted<FrozenReveal<Seconds<Plus<IntroTicksPerSecond, Twice<Beat>>, IntroTicksPerSecond>, SwiftParaRow>>>.self
        Air<U8>.self
        Fixed<PageBuildTall, SpanHosted<FrozenReveal<Seconds<Plus<IntroTicksPerSecond, Twice<Beat>>, IntroTicksPerSecond>, PageBuildParaRow>>>.self
        Air<Plus<U16, U8>>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, ReadingsHeadRow>>>.self
        Fixed<ReadingsIntroTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, ReadingsIntroRow>>>.self
        Air<U8>.self
        Fixed<LineTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, PanelHeadRow>>>.self
        Air<U4>.self
        Fixed<LineTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, PairOneRow>>>.self
        Air<U2>.self
        Fixed<LineTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, PairTwoBand>>>.self
        Air<U2>.self
        Fixed<LineTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, PairThreeRow>>>.self
        Air<U8>.self
        Fixed<ReadingsMoralTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, ReadingsMoralParaRow>>>.self
        Fixed<ReadingsBreakTall, SpanHosted<FrozenReveal<Seconds<ReadingsRevealAt, IntroTicksPerSecond>, ReadingsBreakRow>>>.self
        Air<Plus<U16, U8>>.self
        Fixed<RowTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabsHeadRow>>>.self
        Fixed<TabOrgTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabOrgRow>>>.self
        Fixed<TabScaleTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabScaleRow>>>.self
        Fixed<TabBasicsTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabBasicsRow>>>.self
        Fixed<TabWriterTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabWriterRow>>>.self
        Fixed<TabButtonsTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabButtonsRow>>>.self
        Fixed<TabLightTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabLightRow>>>.self
        Fixed<TabAtomTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabAtomRow>>>.self
        Fixed<TabRulesTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TabRulesRow>>>.self
        Air<Plus<U16, U8>>.self
        Fixed<TryLieTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TryLieParaRow>>>.self
        Fixed<TryTwoTall, SpanHosted<FrozenReveal<Seconds<TabsRevealAt, IntroTicksPerSecond>, TryTwoRow>>>.self
        Air<EdgeMargin>.self
    }
}
