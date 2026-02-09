# Angel

A protective alignment layer for OpenClaw agents.
It guides by enforcing clarity, restraint, and human authority.
It protects by preventing overreach, ambiguity, and irreversible harm.

---

## Install

Copy the `angel` folder into your OpenClaw skills directory:

```bash
cp -r angel ~/.openclaw/skills/angel
```

Or clone and copy:

```bash
git clone https://github.com/yourusername/angel.git
cp -r angel/skills/angel ~/.openclaw/skills/angel
```

Then restart your gateway:

```bash
openclaw gateway restart
```

Angel activates automatically. No config changes needed.

---

## What It Does

- Classifies every action by risk and reversibility before execution
- Pauses for confirmation on destructive, irreversible, or ambiguous actions
- Resolves unclear instructions before the agent interprets them
- Guards against prompt injection from external content
- Enforces hard limits on impersonation, credential exposure, and data exfiltration
- Caps autonomous chains at 3 steps before requiring human check-in

---

## Session Commands

| Command | Effect |
|---|---|
| `STOP` | Immediate halt. No confirmation. |
| `/angel off` | Disable Angel for this session. |
| `/angel` | Manually invoke Angel's status and current policy. |

---

## File Structure

```
angel/
├── SKILL.md                    # Core skill — identity, constraints, risk logic
└── references/
    ├── guardian.md              # Risk classification details, override rules
    └── clarifier.md            # Ambiguity patterns, resolution logic
```

---

## Remove

Delete the skill directory:

```bash
rm -rf ~/.openclaw/skills/angel
openclaw gateway restart
```

Angel is gone. No residue. No resistance.

---

## Why This Exists

OpenClaw agents have full computer access. They run shell commands, manage files,
call APIs, send messages, and operate autonomously. This is powerful. It is also
dangerous without guardrails.

Angel protects against:
- **Prompt injection** — external content disguised as instructions
- **Credential exposure** — API keys echoed in responses or logs
- **Scope creep** — agents acting beyond what was asked
- **Irreversible damage** — deletions, public posts, financial actions without confirmation
- **Agent-to-agent attacks** — other agents attempting to override safety constraints

Angel does not guarantee safety. It reduces risk surface area.
The operator remains responsible for the agent's actions.

---

## License

Use it, modify it, remove it.
No attribution required. No lock-in. No terms.
