# feature-dev for OpenAI Codex CLI

A structured 7-phase feature development workflow for the OpenAI Codex CLI,
ported from the [Mistral Vibe version](https://github.com/garethhallberg/feature-dev-vibe)
and the [VS Code version](https://github.com/garethhallberg/feature-dev-vscode),
originally inspired by the Claude Code `feature-dev` command.

Rather than jumping straight into code, this skill guides you through
understanding the existing codebase, clarifying requirements, designing
architecture thoughtfully, and conducting quality reviews before and after
implementation.

## Prerequisites

- OpenAI Codex CLI installed (`npm install -g @openai/codex`)
- ChatGPT Plus, Pro, Business, or Enterprise plan (or API key)

## What's included

```
feature-dev-codex/
├── feature-dev-SKILL.md        # Main orchestrator (invoked via $feature-dev)
├── code-explorer-SKILL.md      # Read-only codebase exploration
├── code-architect-SKILL.md     # Architecture design proposals
├── code-reviewer-SKILL.md      # Quality review with priority scoring
├── install.sh                  # Installs into .codex/skills/
└── README.md
```

## Installation

### Option 1: Project-level (recommended)

```bash
chmod +x install.sh
./install.sh /path/to/your/project
```

This installs into `.codex/skills/` within the project, so the skills travel
with the repo.

### Option 2: Global (all projects)

```bash
chmod +x install.sh
./install.sh --global
```

This installs into `~/.codex/skills/` so the skills are available everywhere.

Restart Codex after installing.

## Usage

In the Codex CLI TUI or with `codex exec`:

```
$feature-dev Add rate limiting to the public API
$feature-dev Implement on-device speech recognition
$feature-dev
```

You can also use the sub-skills independently:

- `$code-explorer` — "Trace how authentication works in this codebase"
- `$code-architect` — "Design an approach for adding WebSocket support"
- `$code-reviewer` — "Review the files I changed in my last commit"

Or type `/skills` in the Codex TUI to see all available skills and select one.

## The 7 Phases

| Phase | What happens | User input? |
| ----- | ------------ | ----------- |
| 1. Discovery | Understand the feature request | ✓ Confirm understanding |
| 2. Codebase Exploration | Explore existing code via `$code-explorer` | — |
| 3. Clarifying Questions | Resolve ambiguity with targeted questions | ✓ Answer questions |
| 4. Architecture Design | Propose approaches via `$code-architect` | ✓ Choose approach |
| 5. Implementation | Build the feature | — (pause if needed) |
| 6. Quality Review | Review via `$code-reviewer` | ✓ Approve fixes |
| 7. Summary | Report what was built and next steps | — |

## How it maps across platforms

| Concept | Claude Code | Mistral Vibe | VS Code Copilot | Codex CLI |
| ------- | ----------- | ------------ | --------------- | --------- |
| Skill file | Plugin | `SKILL.md` | `SKILL.md` | `SKILL.md` |
| Subagents | Built-in | TOML + prompts | `.agent.md` | Separate skills |
| Invocation | `/feature-dev` | `/feature-dev` | `/feature-dev` | `$feature-dev` |
| Delegation | Parallel agents | `task` tool | Agent handoffs | `$skill-name` |
| Install location | Plugin store | `~/.vibe/` | `.github/` | `.codex/skills/` |

Key difference for Codex: there's no separate "agent" concept — everything is
a skill. The three subagents from Vibe/VS Code become three separate skills
that the main `$feature-dev` skill invokes by name.

## Customisation

- Edit skills directly in `.codex/skills/` (or `~/.codex/skills/` for global)
- Add project-level instructions in `AGENTS.md` at the repo root for coding
  conventions that all skills should follow
- Restart Codex after editing skills
