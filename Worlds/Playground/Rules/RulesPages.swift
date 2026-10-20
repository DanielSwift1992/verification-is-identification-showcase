import VerificationIsIdentification
import DocumentKit

public enum TitleRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<TitleLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum MovesHeadRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<MovesHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum MovesIntroOneRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, MovesIntroOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum MovesIntroTwoRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, MovesIntroTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum MoveCardsRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<ExpandCard>.self
        Air<U16>.self
        Flexible<CompressCard>.self
        Air<EdgeMargin>.self
    }
}
public enum ExpandTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<ExpandHeadLabel, Layered<ExpandOneLabel, ExpandTwoLabel>>>.self
        Air<FarColumn>.self
    }
}
public enum CompressTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<FarColumn>.self
        Flexible<Layered<CompressHeadLabel, Layered<CompressOneLabel, CompressTwoLabel>>>.self
        Air<InnerMargin>.self
    }
}
public enum MovesBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        MoveCardsRow.self
        ExpandTextRow.self
        CompressTextRow.self
    }
}
public enum MovesNoteOneRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, MovesNoteOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum MovesNoteTwoRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, MovesNoteTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum FormsHeadRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FormsHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum FormCardRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<FormCard>.self
        Air<EdgeMargin>.self
    }
}
public enum FormOneTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<FormOneCodeLabel, FormOneNoteLabel>>.self
        Air<InnerMargin>.self
    }
}
public enum FormOneBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FormCardRow.self
        FormOneTextRow.self
    }
}
public enum FormTwoTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<FormTwoCodeLabel, FormTwoNoteLabel>>.self
        Air<InnerMargin>.self
    }
}
public enum FormTwoBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FormCardRow.self
        FormTwoTextRow.self
    }
}
public enum FormThreeTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<FormThreeCodeLabel, FormThreeNoteLabel>>.self
        Air<InnerMargin>.self
    }
}
public enum FormThreeBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FormCardRow.self
        FormThreeTextRow.self
    }
}
public enum FormFourTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<FormFourCodeLabel, FormFourNoteLabel>>.self
        Air<InnerMargin>.self
    }
}
public enum FormFourBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FormCardRow.self
        FormFourTextRow.self
    }
}
public enum FormFiveTextRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<InnerMargin>.self
        Flexible<Layered<FormFiveCodeLabel, FormFiveNoteLabel>>.self
        Air<InnerMargin>.self
    }
}
public enum FormFiveBand: Group {
    @StructureBuilder
    public static var body: some Structure {
        FormCardRow.self
        FormFiveTextRow.self
    }
}
public enum LawHeadRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<LawHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum LawOneRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, LawOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum LawTwoRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, LawTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum LawThreeRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, LawThreeLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum NamesHeadRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Flexible<NamesHeadLabel>.self
        Air<EdgeMargin>.self
    }
}
public enum NamesOneRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, NamesOneLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum NamesTwoRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, NamesTwoLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}
public enum RulesBreakRow: HFlow {
    public typealias Given = RulesSurface
    @StructureBuilder
    public static var body: some Structure & Divides {
        Air<EdgeMargin>.self
        Fixed<RulesParaWide, RulesBreakLabel>.self
        Flexible<SpanNothing>.self
        Air<EdgeMargin>.self
    }
}

public enum RulesArt: GrownDiagram {
    public typealias Across = RulesSurface
    public typealias AriaLabel = RulesAlt
    @StructureBuilder
    public static var body: some Structure & DividesY {
        Air<EdgeMargin>.self
        Fixed<HeadTall, SpanHosted<TitleRow>>.self
        Air<U8>.self
        Fixed<SectionTall, SpanHosted<MovesHeadRow>>.self
        Fixed<MovesIntroOneTall, SpanHosted<MovesIntroOneRow>>.self
        Fixed<MovesIntroTwoTall, SpanHosted<MovesIntroTwoRow>>.self
        Air<U8>.self
        Fixed<MoveTall, SpanHosted<MovesBand>>.self
        Air<Plus<U8, U4>>.self
        Fixed<MovesNoteOneTall, SpanHosted<MovesNoteOneRow>>.self
        Fixed<MovesNoteTwoTall, SpanHosted<MovesNoteTwoRow>>.self
        Air<U16>.self
        Fixed<SectionTall, SpanHosted<FormsHeadRow>>.self
        Fixed<FormTall, SpanHosted<FormOneBand>>.self
        Air<U8>.self
        Fixed<FormTall, SpanHosted<FormTwoBand>>.self
        Air<U8>.self
        Fixed<FormTall, SpanHosted<FormThreeBand>>.self
        Air<U8>.self
        Fixed<FormTall, SpanHosted<FormFourBand>>.self
        Air<U8>.self
        Fixed<FormTall, SpanHosted<FormFiveBand>>.self
        Air<U16>.self
        Fixed<SectionTall, SpanHosted<LawHeadRow>>.self
        Fixed<LawOneTall, SpanHosted<LawOneRow>>.self
        Fixed<LawTwoTall, SpanHosted<LawTwoRow>>.self
        Fixed<LawThreeTall, SpanHosted<LawThreeRow>>.self
        Air<U16>.self
        Fixed<SectionTall, SpanHosted<NamesHeadRow>>.self
        Fixed<NamesOneTall, SpanHosted<NamesOneRow>>.self
        Fixed<NamesTwoTall, SpanHosted<NamesTwoRow>>.self
        Air<Plus<U8, U4>>.self
        Fixed<RulesBreakTall, SpanHosted<RulesBreakRow>>.self
        Air<EdgeMargin>.self
    }
}
