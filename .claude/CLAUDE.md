# Claude Code BA Plugin Instructions

This file contains instructions for Claude Code when using the BA plugin.

## Plugin Purpose

This BA plugin provides specialized skills for:
- User story generation
- Requirements analysis
- Diagram creation (sequence, ER, flowchart, architecture)
- API documentation
- Meeting transcript analysis
- Prototype generation
- UX assessment
- Story review and validation

## Usage Guidelines

### 1. Context Awareness

Before generating user stories or analysis:
- **Read PROJECT_CONTEXT.md** to understand domain entities and personas
- **Read ARCHITECTURE.md** to understand technical constraints
- Use project-specific terminology consistently

### 2. User Story Format

All user stories should follow this format:

```
Title: [Clear, action-oriented title]

As a [Persona from PROJECT_CONTEXT.md]
I want to [specific action]
So that [business value]

Acceptance Criteria:
Given [precondition]
When [action]
Then [expected outcome]

Technical Considerations:
- [Constraint from ARCHITECTURE.md]
- [Implementation pattern]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
```

### 3. Skill Invocation

Use the `/ba` orchestrator for complex requests:
- `/ba create user stories for [feature]` - Routes to story generation
- `/ba analyze [transcript/requirements]` - Routes to analysis
- `/ba diagram [description]` - Routes to diagram generation

Or use specific skills directly:
- `/story` - Generate single user story
- `/slice` - Break down large features
- `/diagram` - Create Mermaid diagrams
- `/analyze-requirements` - Analyze requirements quality
- `/analyze-transcript` - Extract insights from meetings
- `/api-docs` - Generate API documentation
- `/prototype` - Create HTML/CSS/JS prototypes
- `/review-story` - Review existing user stories
- `/ux-assessment` - Evaluate UI designs

### 4. Azure DevOps Integration

When ADO MCP is configured:
- Fetch work items directly: `curl` or MCP resources
- Update work items with generated content
- Link related work items
- Use proper work item types (User Story, Bug, Task)

### 5. Diagram Generation

Use Mermaid syntax for diagrams:
- **Sequence diagrams** - for workflows and interactions
- **ER diagrams** - for data models
- **Flowcharts** - for process flows
- **Architecture diagrams** - for system design

### 6. Prototype Generation

When creating prototypes:
- Save to `\tmp\` directory
- Use semantic HTML
- Include inline CSS for portability
- Add JavaScript for interactivity
- Follow design system from PROJECT_CONTEXT.md (if specified)

### 7. Quality Standards

All generated content should:
- ✅ Be clear and unambiguous
- ✅ Use domain terminology from PROJECT_CONTEXT.md
- ✅ Respect constraints from ARCHITECTURE.md
- ✅ Include acceptance criteria with Given/When/Then
- ✅ Consider edge cases and error scenarios
- ✅ Be testable and measurable

### 8. Workflow Best Practices

1. **Start with context** - Always read PROJECT_CONTEXT.md and ARCHITECTURE.md first
2. **Understand scope** - Clarify requirements before generating stories
3. **Break down complexity** - Use `/slice` for large features
4. **Validate feasibility** - Check against technical constraints
5. **Review and iterate** - Use `/review-story` to validate generated stories

## Configuration

### Environment Variables

- `AZURE_DEVOPS_PAT` - Personal Access Token for Azure DevOps API (if used)

### Settings

Check `.claude/settings.json` for:
- Permission configurations
- Allowed commands
- Integration settings

## Technical Constraints

### General Best Practices

- Always validate user input
- Follow security best practices (no hardcoded secrets, sanitize input)
- Consider performance implications
- Write testable code
- Document assumptions and decisions

### Project-Specific Constraints

See ARCHITECTURE.md for project-specific technical constraints and patterns.

## Memory Management

The plugin maintains conversation memory for:
- User preferences
- Project-specific patterns
- Feedback on generated content
- Domain knowledge

Memory is stored in `.claude/projects/*/memory/` and persists across sessions.

## Troubleshooting

### Skills not loading
- Verify `.claude/skills/` directory structure
- Check skill SKILL.md files exist
- Restart Claude Code

### Context not being used
- Ensure PROJECT_CONTEXT.md and ARCHITECTURE.md are filled in
- Reference them explicitly: "Check PROJECT_CONTEXT.md for entities"

### ADO integration fails
- Verify `AZURE_DEVOPS_PAT` environment variable is set
- Check PAT has correct permissions
- Test with: `echo $env:AZURE_DEVOPS_PAT` (Windows) or `echo $AZURE_DEVOPS_PAT` (Mac/Linux)

## Support

For issues or questions:
1. Check README.md for common scenarios
2. Review skill-specific documentation in `.claude/skills/*/`
3. Consult ARCHITECTURE.md for technical patterns
4. Refer to Claude Code documentation: https://docs.claude.ai/code

## Updates

Keep the plugin updated:
- Pull latest changes regularly
- Review changelog for breaking changes
- Update PROJECT_CONTEXT.md as domain evolves
- Refresh ARCHITECTURE.md when tech stack changes
