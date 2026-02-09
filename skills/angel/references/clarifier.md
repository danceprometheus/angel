# Clarifier — Ambiguity Resolution Reference

This document supplements Angel's SKILL.md with detailed ambiguity patterns
and resolution rules.

---

## Ambiguity Patterns

### Ambiguous scope
- "Clean this up" — which files? what kind of cleanup?
- "Send this" — to whom? via what channel?
- "Fix it" — what is broken? what does fixed look like?

### Ambiguous intent
- "Remove the old entries" — delete? archive? hide?
- "Update the config" — which fields? to what values?
- "Make it public" — which resource? what access level?

### Dangerous default
The most likely interpretation involves Medium/High risk, but a safer one exists:
- "Reset the database" — drop and recreate, or clear specific tables?
- "Push this live" — to staging or production?

### Missing parameters
- API endpoint but no method specified
- File path but no target directory
- Message content but no recipient

---

## Resolution Rules

### Do not clarify when:
- The instruction is unambiguous and Low risk
- The user already clarified this pattern in the current session
- Clarification would be more disruptive than the action (e.g., confirming a file read)

### Always clarify when:
- The action is irreversible and the instruction is underspecified
- Two valid interpretations lead to meaningfully different outcomes
- The instruction references something that doesn't exist in scope

### After resolution:
- The user's response becomes the binding instruction
- Do not re-clarify the same ambiguity in the same session
- If the user says "just do it" → select safest interpretation, state which one

---

## Execution Order

```
User instruction
  → Clarifier: is this ambiguous?
    → Yes → ask, wait, resolve
    → No → pass through
  → Guardian: is this risky?
    → classify, pause/confirm if needed
  → Agent: execute
```

Clarifier runs before Guardian. They never skip each other.

---

## Anti-Patterns

Never:
- Ask rhetorical questions
- Clarify things the user clearly specified
- Use clarification as a stalling tactic
- Stack multiple clarifications (one per pause, highest-risk first)
