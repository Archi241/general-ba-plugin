# General BA Plugin

**Universal Business Analysis plugin for Claude Code**

A comprehensive, project-agnostic BA plugin with 12 specialized skills for requirements analysis, user story generation, and workflow automation.

---

## 🚀 Quick Start

### Installation

1. Copy the `.claude` folder to your project root
2. Fill in `PROJECT_CONTEXT.md` with your domain entities and personas
3. Fill in `ARCHITECTURE.md` with your tech stack and constraints
4. Open your project in Claude Code
5. Type `/ba` to see all available skills

**That's it!** The plugin adapts to your project context.

---

## 📋 Available Skills

### Core Workflow

- **`/ba`** - Smart orchestrator that routes to specialized skills
- **`/story`** - Generate detailed user stories with Gherkin acceptance criteria
- **`/slice`** - Break down features into vertical, implementable stories
- **`/review-story`** - Review stories for technical feasibility and quality

### Analysis

- **`/analyze-transcript`** - Extract insights from meeting transcripts
- **`/analyze-requirements`** - Assess requirements quality and completeness

### Documentation

- **`/api-docs`** - Generate OpenAPI specs and API documentation
- **`/diagram`** - Create Mermaid diagrams (sequence, flowchart, ER, architecture)

### Development

- **`/prototype`** - Build working HTML prototypes
- **`/code-qa`** - Answer codebase questions based on actual implementation
- **`/ux-assessment`** - Evaluate UI/UX designs for accessibility and usability
- **`/audit-skills`** - Generate inventory of all skills in the repository

---

## 🎯 Common Workflow

```bash
# 1. Start with a feature idea
/ba user onboarding workflow

# 2. Plugin analyzes and routes automatically
# → Detects it's a feature (not single story)
# → Routes to /slice for breakdown
# → /slice reads your PROJECT_CONTEXT.md
# → /slice creates vertical stories

# 3. Review and approve story slices
# → Plugin invokes /story for each approved slice

# 4. Generate detailed stories
# → Each story includes:
#   • Complete template sections
#   • Gherkin acceptance criteria
#   • Accessibility requirements (WCAG 2.1 AA)
#   • Standard subtasks
#   • Your project terminology and entities

# 5. Optional: Push to work tracking system
# → Use Azure DevOps CLI or other integration
```

---

## 📁 What's Included

### Context Files (Configure these!)

#### `.claude/PROJECT_CONTEXT.md`
Define your project's domain:
- Core entities (e.g., User, Order, Product)
- User personas (e.g., Admin, Customer, Manager)
- Business terminology
- Domain-specific rules

#### `.claude/ARCHITECTURE.md`
Document your tech stack:
- Backend framework and language
- Frontend framework
- Database and ORM
- API style (REST, GraphQL, etc.)
- Technical constraints and patterns

### Templates

- **user-story-backend-example.md** - Backend API story template
- **user-story-ui-example.md** - UI/Frontend story template

Customize these templates for your organization's standards.

### Skills (12 total)

All skills in `.claude/skills/` are ready to use:
- Core workflow: ba, story, slice, review-story
- Analysis: analyze-transcript, analyze-requirements
- Documentation: api-docs, diagram
- Development: prototype, code-qa, ux-assessment
- Utilities: audit-skills

### Hooks & Scripts

- **Hooks** - Automation for skill invocation
- **Scripts** - Utility scripts for plugin maintenance

---

## 🔧 Setup Guide

### Step 1: Configure Project Context

Edit `.claude/PROJECT_CONTEXT.md`:

```markdown
## Core Entities

### User
Registered account in the system.
**Example:** "As an Admin, I want to create a new user..."

### Order
Customer purchase with line items.
**Example:** "As a Customer, I want to view my orders..."

## Personas

### Admin
System administrator with full permissions.
**Use this for:** User management, system configuration

### Customer
End user who makes purchases.
**Use this for:** Shopping, orders, account management
```

### Step 2: Configure Architecture

Edit `.claude/ARCHITECTURE.md`:

```markdown
## Tech Stack

### Backend
- **Node.js 20** - Runtime
- **Express.js** - Web framework
- **PostgreSQL** - Database
- **Prisma ORM** - Data access

### Frontend
- **React 18** - UI library
- **TypeScript** - Language
- **Material-UI** - Component library

## Critical Constraints

❌ **NEVER** use `any` type in TypeScript
✅ **ALWAYS** use async/await (no callbacks)
✅ **ALWAYS** validate input with Zod schemas
```

### Step 3: Customize Templates (Optional)

Modify story templates in `.claude/templates/` to match your:
- Acceptance criteria format
- Definition of Done checklist
- Required sections
- Organization standards

### Step 4: Start Using Skills

```bash
# Test the setup
/ba

# Generate your first story
/story Add user registration form

# Break down a feature
/slice Order management workflow
```

---

## 💡 Best Practices

### 1. Keep Context Files Updated

Review and update `PROJECT_CONTEXT.md` and `ARCHITECTURE.md`:
- When new entities are added
- When tech stack changes
- When domain terminology evolves
- Quarterly as a minimum

### 2. Use the Right Skill

- **Large features** → `/slice` (breaks into stories)
- **Single stories** → `/story` (generates one story)
- **Meeting notes** → `/analyze-transcript` (extracts requirements)
- **Requirements docs** → `/analyze-requirements` (checks quality)

### 3. Leverage Context

The plugin automatically loads your context files. The more complete they are, the better the generated stories.

### 4. Review Generated Content

Always review generated stories for:
- Accuracy of domain terminology
- Technical feasibility
- Completeness of acceptance criteria
- Alignment with your standards

---

## 🔌 Optional Integrations

### Azure DevOps

Use Azure CLI for work item creation:

```bash
# Install Azure DevOps extension
az extension add --name azure-devops

# Configure organization and project
az devops configure --defaults organization=https://dev.azure.com/yourorg project=YourProject

# The plugin can create work items via CLI
```

### Figma

Configure Figma MCP for design integration:
- Extract accessibility annotations
- Reference design components
- Link mockups to stories

Add to `.claude/settings.json`:
```json
{
  "permissions": {
    "allow": [
      "mcp__figma__*"
    ]
  }
}
```

### Other Work Tracking Systems

The plugin generates stories in markdown format. Export to:
- Jira (via API or copy/paste)
- GitHub Issues (via gh CLI)
- Linear (via API)
- Any system that accepts markdown

---

## 📖 Documentation

- **[Installation Guide](.claude/INSTALL.md)** - Detailed setup instructions
- **[Workflow Guidelines](.claude/BA_WORKFLOW_GUIDELINES.md)** - BA best practices
- **[Skill Descriptions](.claude/skills/)** - Individual skill documentation
- **[CLAUDE.md](.claude/CLAUDE.md)** - Plugin instructions for Claude

---

## 🛠️ Troubleshooting

### Skills not showing up

```bash
# Verify .claude folder structure
ls .claude/skills/

# Restart Claude Code
```

### Context not being used

- Ensure `PROJECT_CONTEXT.md` and `ARCHITECTURE.md` are filled in
- Check files are in `.claude/` directory
- Reference them explicitly: "Check PROJECT_CONTEXT.md for entities"

### Stories don't match project conventions

- Review and update `ARCHITECTURE.md` constraints
- Customize templates in `.claude/templates/`
- Add project-specific patterns to context files

---

## 🤝 Contributing

This is a general-purpose plugin. To customize for your organization:

1. Fork or copy this plugin
2. Update context files with your domain
3. Modify templates to match your standards
4. Add organization-specific skills if needed
5. Share with your team

---

## 📝 Changelog

### v1.0.0 (Initial Release)
- ✨ 12 BA skills (story, slice, analyze, diagram, prototype, review, etc.)
- ✅ Project-agnostic design with customizable context
- ✅ Comprehensive templates and documentation
- ✅ Hook system for automation
- ✅ WCAG 2.1 AA accessibility standards

---

## 📄 License

**Open Source** - Free to use and customize for your projects.

---

## 🆘 Support

For issues or questions:
1. Check documentation in `.claude/` folder
2. Review skill-specific SKILL.md files
3. Consult Claude Code documentation: https://docs.claude.ai/code

---

**Happy Analyzing! 🚀**

---

## Why This Plugin?

### Problems It Solves

✅ **Inconsistent story quality** - Templates ensure all required sections  
✅ **Missing accessibility** - WCAG 2.1 AA built into every UI story  
✅ **Time-consuming BA work** - Automated story generation from features  
✅ **Context switching** - Claude remembers your domain and constraints  
✅ **Requirements gaps** - Analysis skills catch issues early  
✅ **Unclear workflows** - Diagram generation visualizes flows  

### Key Benefits

- **Project-Agnostic**: Works with any tech stack, domain, or methodology
- **Customizable**: Templates and context adapt to your standards
- **Complete**: 12 skills cover the full BA workflow
- **Quality-Focused**: Built-in accessibility, testing, and review
- **Fast**: Context pre-loading and smart routing save time
- **Integrated**: Works with Azure DevOps, Figma, and other tools

---

## Quick Links

- [Installation Guide](.claude/INSTALL.md)
- [BA Workflow Guidelines](.claude/BA_WORKFLOW_GUIDELINES.md)
- [Project Context Template](.claude/PROJECT_CONTEXT.md)
- [Architecture Template](.claude/ARCHITECTURE.md)
- [Skills Directory](.claude/skills/)
