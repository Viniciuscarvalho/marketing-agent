# Marketing Agents for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-ffd60a?style=flat-square)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Subagents-8A2BE2?logo=anthropic&logoColor=white&style=flat-square)](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
[![Agents](https://img.shields.io/badge/Agents-14_specialists-2ea44f?style=flat-square)](#agents)
[![GitHub Sponsors](https://img.shields.io/badge/Sponsor-❤-ea4aaa?logo=github-sponsors&logoColor=white&style=flat-square)](https://github.com/sponsors/Viniciuscarvalho)

A collection of 14 specialized marketing subagents for [Claude Code](https://docs.anthropic.com/en/docs/claude-code/sub-agents). Drop them into any project's `.claude/agents/` directory and Claude will automatically delegate marketing tasks to the right specialist.

## Quick Install

**One-liner (global — available in all your projects):**

```bash
curl -fsSL https://raw.githubusercontent.com/Viniciuscarvalho/marketing-agent/main/install.sh | bash -s -- --global
```

**One-liner (project-only — current project):**

```bash
curl -fsSL https://raw.githubusercontent.com/Viniciuscarvalho/marketing-agent/main/install.sh | bash -s -- --project
```

**Or clone and run interactively:**

```bash
git clone https://github.com/Viniciuscarvalho/marketing-agent.git
cd marketing-agent
./install.sh
```

## Agents

| Category | Agent | File | Model |
|----------|-------|------|-------|
| **Content & SEO** | SEO Strategist | `seo-strategist.md` | sonnet |
| | Content Strategist | `content-strategist.md` | sonnet |
| | Copywriter | `copywriter.md` | sonnet |
| **Social & Community** | Social Media Manager | `social-media-manager.md` | sonnet |
| | Community Manager | `community-manager.md` | sonnet |
| **Product Marketing** | Product Marketing Manager | `product-marketing-manager.md` | opus |
| | GTM Strategist | `gtm-strategist.md` | opus |
| **Email & Lifecycle** | Email Marketing Specialist | `email-marketing-specialist.md` | sonnet |
| | Lifecycle Marketing Manager | `lifecycle-marketing-manager.md` | sonnet |
| **Analytics & CRO** | Marketing Analyst | `marketing-analyst.md` | sonnet |
| | CRO Specialist | `cro-specialist.md` | sonnet |
| **PR & Comms** | PR Strategist | `pr-strategist.md` | sonnet |
| | Communications Manager | `communications-manager.md` | opus |

## How It Works

Each agent is a Markdown file with YAML frontmatter following [Claude Code's subagent spec](https://code.claude.com/docs/en/sub-agents). Claude Code automatically discovers them and delegates tasks based on the `description` field.

You can also invoke them explicitly:

```
> Use the copywriter agent to write landing page copy for our new feature.
> Use the seo-strategist agent to audit our blog's keyword strategy.
> Use the gtm-strategist agent to plan the launch of our v2.0.
```

## Composing Agents

Agents work independently or as pipelines. Example workflows:

- **Content Pipeline**: `content-strategist` → `seo-strategist` → `copywriter`
- **Launch Campaign**: `product-marketing-manager` → `gtm-strategist` → `email-marketing-specialist` → `social-media-manager`
- **Growth Loop**: `marketing-analyst` → `cro-specialist` → `lifecycle-marketing-manager`
- **PR Push**: `pr-strategist` → `communications-manager` → `social-media-manager`

## Customization

Each `.md` file is self-contained. Edit the YAML frontmatter to change model, tools, or description. Edit the markdown body to change the system prompt.

```yaml
---
name: copywriter
description: "Your updated description..."
tools: Read, Glob, Grep, Bash, Write  # add Write if you want it to create files
model: haiku  # switch to haiku for lower cost
---
```

## License

MIT — see [LICENSE](./LICENSE)
