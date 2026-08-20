# PersonalOS — Documentation

Entry point for all project documentation. Read this first.

## Project Status

- **Phase:** Architecture refinement — COMPLETE
- **Documentation:** COMPLETE (this set)
- **Integration:** TEMP-PLANNING pipeline CLOSED 2026-08-20 — census + no-holes gates cleared; docs/ are the source of truth; design-lock awaits final approval (DevelopmentWorkflow.md S001)
- **Implementation:** NOT STARTED in the docs sense — `lib/` holds only a Flutter scaffold + a preliminary Drift `database.dart` stub; no feature code, no domain logic, no tests
- **Integration summary:** see `IntegrationSummary.md`
- **Next step:** Milestone 0 (see `Roadmap.md`), pending explicit approval

## Non-Negotiable Principles

These principles override every other decision in this project. If a future decision
conflicts with one of these, the principle wins.

1. **Data ownership** — The user's life data belongs to the user. The application
   must always support export, restorable backups, and human-readable formats.
   No permanent vendor lock-in, ever.

2. **Offline-first** — PersonalOS must remain fully usable without internet access.
   Cloud services (Google Drive) are backup and synchronization layers, never
   dependencies. Core functionality — journal creation, habit tracking, dashboard
   viewing, local data processing — works offline.

3. **Core loop priority** — Every feature must justify itself by supporting the
   Core Loop:
   Open Dashboard → Understand priorities → Execute → Record → Reflect →
   Coach feedback → Improve tomorrow.
   Features that do not serve this loop are candidates for removal.

4. **Cloud optionality** — All cloud integration (currently Google Drive) is
   optional and phased. The app must function completely without it. Cloud layers
   are added only after local functionality is proven.

5. **AI is an optional assistant, not a dependency** — AI (DeepSeek API, local
   models) is an optional enhancement for the Coach. The application must operate
   completely, forever, without any paid or external AI. The same principle applies
   to development: AI coding assistants help write the code, but the architecture
   must stay understandable and maintainable by a human.

## Document Map

| Document | Content |
|---|---|
| `Vision.md` | Philosophy, core loop, success criteria |
| `Requirements.md` | Goals, features, non-goals, workflows, constraints, assumptions |
| `Architecture.md` | Event-first system design, modules, data flow, layers |
| `Database.md` | Schema, event log, migrations, backup format, restore |
| `CoachSystem.md` | Coach architecture, MVP rules, strictness modes, AI adapter |
| `Gamification.md` | Meaningful-progress philosophy, XP, streaks |
| `MediaStorage.md` | Media pipeline, compression, repository abstraction, storage limits |
| `StorageDecision.md` | Locked storage decision (Drift + SQLite WASM, DecisionLog D040), M0 spike spec, persistence test |
| `StorageSpikeStatus.md` | Living spike-status doc: Drift vs IndexedDB metrics, iPhone persistence gate, open items |
| `StorageSpikeSessionA.md` | Approved Session A spec (desktop spike: Drift vs IndexedDB, 10k rows + media, overnight persistence); execute in a fresh session |
| `UIUX.md` | Dashboard, navigation, responsive rules |
| `DevelopmentWorkflow.md` | AI-assisted development rules, boundaries, tests |
| `Roadmap.md` | Milestones M0–M8, Drive phases, exit criteria |
| `DecisionLog.md` | Every decision: accepted and rejected, with rationale |
| `IntegrationSummary.md` | Post-integration summary: what the pipeline did, audit headline, open threads |

Provenance: the TEMP-PLANNING integration set — `TEMP-PLANNING.md`,
`IntegrationLedger.md`, `IntegrationIDCensus.md`, `IntegrationIntentBrief.md`,
`StructuralImpactProposal.md`, `IntegrationAuditReport.md` — is archived
date-suffixed in `audits/` (2026-08-20). The docs above are now the single
source of truth; the sequencing notes (S001–S082) live in
`DevelopmentWorkflow.md`.

## How to Read the Docs

- First: `README.md` (you are here) → `Vision.md` → `Requirements.md`.
- Then: `Architecture.md` → `Database.md` for the system shape.
- Domain design: `CoachSystem.md`, `Gamification.md`, `MediaStorage.md`.
- Storage: `StorageDecision.md` + `StorageSpikeStatus.md` — read before starting Milestone 0.
- Process: `DevelopmentWorkflow.md` before writing any code.
- Sequencing: `Roadmap.md` before starting any milestone.
- History: `DecisionLog.md` before reversing any decision.

## Conventions Used in This Project

- All dates in `YYYY-MM-DD` format.
- The user is referred to as "the user" (single person, single device owner).
- "MVP" means the first usable version defined in `Requirements.md`.
