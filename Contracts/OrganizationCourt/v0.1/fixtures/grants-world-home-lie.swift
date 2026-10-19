// the facts world, yours: the source you read and edit, and the
// one this tool answers for. Not a generated artifact. The tables
// only seeded it once, below, and from here the world is what is
// edited and judged. A gate.manifest.swift may split it across
// several files, all judged together. git carries the history.
//
// seeded by gate import from: people.csv, grants.csv
//
// the language it is written in: `gate stdlib show forms-organization`.
// Those words are carried by the judge, and `materialize` writes them out
// beside this file to read: editing that copy adds no word to the language.

public enum Edsger: GivenNameCycle {
    public typealias Next = Barbara
    public typealias Sex = Male
}

public enum Barbara: GivenNameCycle {
    public typealias Next = John
    public typealias Sex = Female
}

public enum John: GivenNameCycle {
    public typealias Next = Margaret
    public typealias Sex = Male
}

public enum Margaret: GivenNameCycle {
    public typealias Next = Donald
    public typealias Sex = Female
}

public enum Donald: GivenNameCycle {
    public typealias Next = Dennis
    public typealias Sex = Male
}

public enum Dennis: GivenNameCycle {
    public typealias Next = Edsger
    public typealias Sex = Male
}

public enum Dijkstra: FamilyNameCycle {
    public typealias Next = Knuth
}

public enum Knuth: FamilyNameCycle {
    public typealias Next = Dijkstra
}

public enum Y1925: BirthYearCycle {
    public typealias Next = Y1937
}

public enum Y1937: BirthYearCycle {
    public typealias Next = Y1925
}

public enum Emp9000: Employee, Person {
    public typealias Rank = Manager
    public typealias Home = Engineering
    public typealias Given = Edsger
    public typealias Family = Dijkstra
    public typealias Born = Y1925
    public typealias Site = OnSite
    public typealias Sex = Given.Sex
}

public enum Emp9001: Employee, Person {
    public typealias Rank = Lead
    public typealias Home = Finance
    public typealias Given = Barbara
    public typealias Family = Dijkstra
    public typealias Born = Y1925
    public typealias Site = Remote
    public typealias Sex = Given.Sex
}

public enum Emp9002: Employee, Person {
    public typealias Rank = IndividualContributor
    public typealias Home = Finance
    public typealias Given = John
    public typealias Family = Dijkstra
    public typealias Born = Y1925
    public typealias Site = OnSite
    public typealias Sex = Given.Sex
}

public enum Emp9003: Employee, Person {
    public typealias Rank = Manager
    public typealias Home = Engineering
    public typealias Given = Margaret
    public typealias Family = Knuth
    public typealias Born = Y1937
    public typealias Site = Hybrid
    public typealias Sex = Given.Sex
}

public enum Emp9004: Employee, Person {
    public typealias Rank = Lead
    public typealias Home = Engineering
    public typealias Given = Donald
    public typealias Family = Knuth
    public typealias Born = Y1937
    public typealias Site = OnSite
    public typealias Sex = Given.Sex
}

public enum Emp9005: Employee, Person {
    public typealias Rank = IndividualContributor
    public typealias Home = Engineering
    public typealias Given = Dennis
    public typealias Family = Knuth
    public typealias Born = Y1937
    public typealias Site = Remote
    public typealias Sex = Given.Sex
}

public enum ImportedTeam: Team {
    @StructureBuilder
    public static var body: some Structure {
        VerifiedInDepartment<
            Emp9000,
            Finance
        >.self
        VerifiedAtRank<
            Emp9000,
            Manager
        >.self
        VerifiedAtWorkplace<
            Emp9000,
            OnSite
        >.self
        VerifiedInDepartment<
            Emp9001,
            Finance
        >.self
        VerifiedAtRank<
            Emp9001,
            Lead
        >.self
        VerifiedAtWorkplace<
            Emp9001,
            Remote
        >.self
        VerifiedInDepartment<
            Emp9002,
            Finance
        >.self
        VerifiedAtRank<
            Emp9002,
            IndividualContributor
        >.self
        VerifiedAtWorkplace<
            Emp9002,
            OnSite
        >.self
        VerifiedInDepartment<
            Emp9003,
            Engineering
        >.self
        VerifiedAtRank<
            Emp9003,
            Manager
        >.self
        VerifiedAtWorkplace<
            Emp9003,
            Hybrid
        >.self
        VerifiedInDepartment<
            Emp9004,
            Engineering
        >.self
        VerifiedAtRank<
            Emp9004,
            Lead
        >.self
        VerifiedAtWorkplace<
            Emp9004,
            OnSite
        >.self
        VerifiedInDepartment<
            Emp9005,
            Engineering
        >.self
        VerifiedAtRank<
            Emp9005,
            IndividualContributor
        >.self
        VerifiedAtWorkplace<
            Emp9005,
            Remote
        >.self
    }
}

public enum ImportedAccesses: AccessLedger {
    @StructureBuilder
    public static var body: some Structure {
            VerifiedView<
                Emp9000,
                FinanceShare
            >.self
            VerifiedView<
                Emp9001,
                FinanceShare
            >.self
            VerifiedView<
                Emp9002,
                FinanceShare
            >.self
            VerifiedView<
                Emp9003,
                EngineeringShare
            >.self
            VerifiedView<
                Emp9004,
                EngineeringShare
            >.self
            VerifiedView<
                Emp9005,
                EngineeringShare
            >.self
    }
}
