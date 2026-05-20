---
name: story
description: Quick user story generation. Creates detailed user stories with Gherkin acceptance criteria. Automatically determines if feature slicing is needed first for large features.
user-invocable: true
---

# User Story Generation Skill

**What to do:** Generate detailed user stories with Gherkin acceptance criteria based on the provided feature description.

**Usage:** `/story [feature description]`

---

## 🔄 WORKFLOW: Read Context Files First

**BEFORE generating any stories, follow this workflow:**

### Step 1: Read Story Template (REQUIRED - DO THIS FIRST!)

**Determine story type and read the appropriate template:**

```
IF user request is for Backend/API feature:
  → Read .claude/templates/user-story-backend-example.md
  → Study the structure, sections, and format
  → You MUST follow this template exactly

IF user request is for UI/Frontend feature:
  → Read .claude/templates/user-story-ui-example.md
  → Study the structure, sections, and format
  → You MUST follow this template exactly

IF unclear whether Backend or UI:
  → Read BOTH templates
  → Ask user to clarify, OR
  → Generate both Backend AND UI stories
```

### Step 2: Read Project Context Files (REQUIRED)

Read these files to understand your project's domain and architecture:

```
1. Read .claude/PROJECT_CONTEXT.md
   → Understand: Core entities (e.g., User, Order, Product)
   → Understand: Personas (e.g., Admin, Customer, Manager)
   → Understand: Domain terminology
   → Understand: Business rules and workflows

2. Read .claude/ARCHITECTURE.md
   → Understand: Tech stack (backend, frontend, database)
   → Understand: Data access patterns
   → Understand: Technical constraints and best practices
   → Understand: Architecture patterns (REST, GraphQL, etc.)
```

### Step 3: Generate Stories Using Template + Context

Now generate stories by combining template structure with project context:
- **Follow template structure exactly** (all required sections)
- Use correct project terminology (from PROJECT_CONTEXT.md)
- Reference correct domain entities
- Apply correct technology constraints (from ARCHITECTURE.md)
- Include project-specific acceptance criteria
- Fill in ALL template sections - do not skip any

---

**Deliverables:**
- User stories (Backend and/or Frontend) following template structure
- All required sections completed per template
- Subtasks for each user story (required for work item creation)
- Offer to create work items in Azure DevOps if requested

---

## 📋 CRITICAL: Follow Template Structure

**BEFORE generating ANY story, read the appropriate template:**

- **Backend/API Story** → Read `.claude/templates/user-story-backend-example.md`
- **UI/Frontend Story** → Read `.claude/templates/user-story-ui-example.md`

**Your generated story MUST include ALL sections from the template:**

### Required Sections (All Stories):

1. **Title** - Clear, descriptive title
2. **User Story** - "As a [persona], I want [capability], So that [benefit]"
3. **Background** - Context and motivation for the feature
4. **Personas** - List of users/roles affected
5. **Dependencies & Assumptions** - Table format with Type and Notes columns
6. **Acceptance Criteria** - Gherkin format (Given-When-Then) for ALL scenarios
7. **Technical Implementation Notes** - Technology stack, validation rules, performance, security
8. **Out of Scope** - Explicitly state what's NOT included
9. **Definition of Done** - Checklist format with all quality gates

### Additional for Backend Stories:

10. **System Info** - API endpoint details
11. **API Endpoints** - Request/response format, error responses, authentication

### Additional for UI Stories:

10. **UI/UX Design** - Wireframe/mockup reference
11. **Accessibility Criteria** - WCAG 2.1 AA requirements (see section below)

---

**Format in conversation (Complete Template):**

```markdown
## Title
[Feature Name] - [Backend/UI]

## User Story
**As a** [persona from PROJECT_CONTEXT.md]
**I want** [capability]
**So that** [business benefit]

## Background
[Why this feature is needed, business context, user pain point being solved]

## Personas
- [Primary Persona] (primary user)
- [Secondary Persona] (affected by this feature)
- [Reviewer Persona] (approver/reviewer)

## Dependencies & Assumptions

| Dependency | Type | Notes |
|------------|------|-------|
| [Entity/API name] | Technical/Data/Infrastructure | [Details] |
| [Library/Service] | Technical | [Version, constraints] |
| [Business rule] | Business | [Assumption details] |

## System Info (Backend Stories Only)

### API Endpoint
`[METHOD] /api/[endpoint]`

### Request Body
```json
{
  "field": "type (validation rules)"
}
```

### Success Response (200 OK)
```json
{
  "data": "response structure"
}
```

### Error Responses
```json
// 400 Bad Request
{ "error": "Validation failed", "details": [] }

// 401 Unauthorized
{ "error": "Authentication required" }

// 404 Not Found
{ "error": "Resource not found" }
```

## UI/UX Design (UI Stories Only)

### Wireframe Reference
[ASCII wireframe or Figma link if available]

### UI Components
- [Component list with design system references]

## Acceptance Criteria

### AC 1: [Scenario Name]
```gherkin
Given [context and preconditions]
And [additional context]
When [user action]
And [additional action]
Then [expected outcome]
And [additional validation]
And [system behavior]
```

### AC 2: [Error Scenario]
```gherkin
Given [error condition setup]
When [action that triggers error]
Then [error handling behavior]
And [error message displayed]
And [system state preserved]
```

[Continue with AC 3, AC 4, etc. for all scenarios including:
 - Happy path
 - Validation errors
 - API errors
 - Edge cases
 - Accessibility (keyboard, screen reader)
 - Responsive design (if UI)
 - Performance requirements]

## Technical Implementation Notes

### [Technology/Framework]
- [Specific requirements]
- [Libraries to use]
- [Patterns to follow]

### Validation Rules
- **Field Name**: [Rule details]

### Error Handling
- [How errors are displayed/logged]

### Performance
- [Performance targets and optimizations]

### Security
- [Security requirements and considerations]

## Out of Scope
- [Feature 1] (separate story)
- [Feature 2] (future enhancement)
- [Feature 3] (separate epic)

## Definition of Done
- [ ] All acceptance criteria pass
- [ ] Unit tests written (>80% coverage for backend, >80% for UI)
- [ ] Integration tests completed
- [ ] Code review completed (2 approvers)
- [ ] Accessibility audit (WCAG 2.1 AA) - UI only
- [ ] Security review completed
- [ ] Performance benchmarks met
- [ ] Documentation updated
- [ ] Deployed to DEV and smoke tested
```

---

**Required Subtasks for Each User Story:**

When creating work items in Azure DevOps, each user story MUST include these subtasks:

1. **Investigate** - Research and design approach
2. **Development** - Implementation of the feature
3. **Code Review 1** - First round of code review
4. **Code Review 2** - Second round of code review
5. **Test Case Design** - Create test scenarios and cases
6. **Testing** - Execute tests and validate functionality

**After Completion - Offer Next Steps:**

After generating stories, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Review Stories** - Validate technical feasibility and completeness (`/review-story`)
> 2. **Create Diagrams** - Visualize flows with sequence or flowchart diagrams (`/diagram`)
> 3. **Create Work Items** - Push stories to Azure DevOps
> 4. **Build Prototype** - Create working prototype to validate concept (`/prototype`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Review Stories" → `Skill(skill: "review-story", args: "[paste generated stories]")`
- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [sequence/flowchart] diagram for [feature name]")`
- If user chooses "Create Work Items" → Use Azure DevOps CLI for PBI creation (see Azure DevOps Work Item Creation section)
- If user chooses "Build Prototype" → `Skill(skill: "prototype", args: "Build prototype for [feature name] implementing: [story summaries]")`

---

## 📋 Accessibility Requirements

**IMPORTANT: All UI stories SHOULD include accessibility acceptance criteria**

### Step 1: Check Design Files for Accessibility Annotations (if available)

**If Figma or other design tool integration is available:**

1. Check if user has provided design file link or reference
2. Access design files to look for accessibility annotations:
   - ARIA labels and roles
   - Keyboard navigation flows
   - Focus order specifications
   - Screen reader hints
   - Color contrast notes
   - Touch target sizes

**If accessibility annotations exist:**
- Incorporate them into acceptance criteria
- Add specific ACs for each annotated accessibility requirement
- Reference design annotation IDs in the story

### Step 2: Apply Web Accessibility Guidelines

**Web Accessibility Standards:**

Follow **WCAG 2.1 Level AA** compliance standards (or your organization's accessibility standards). UI stories should include:

**Required Accessibility Acceptance Criteria:**

1. **Keyboard Navigation**
   ```gherkin
   Given I am using keyboard only
   When I navigate the [feature name]
   Then I can access all interactive elements using Tab/Shift+Tab
   And focus indicators are clearly visible (min 2px outline)
   And logical tab order follows visual layout
   And I can activate controls using Enter/Space keys
   ```

2. **Screen Reader Support**
   ```gherkin
   Given I am using a screen reader (NVDA/JAWS)
   When I navigate the [feature name]
   Then all interactive elements have appropriate ARIA labels
   And form fields announce labels and required status
   And error messages are announced immediately
   And success messages are announced in live regions
   And dynamic content changes are announced
   ```

3. **Color Contrast** (WCAG 2.1 AA)
   ```gherkin
   Given I am viewing the [feature name]
   Then text has minimum 4.5:1 contrast ratio (normal text)
   And large text has minimum 3:1 contrast ratio (18pt+ or 14pt+ bold)
   And UI components have 3:1 contrast against adjacent colors
   And focus indicators have 3:1 contrast
   ```

4. **Touch Targets** (Mobile/Tablet)
   ```gherkin
   Given I am using a touch device
   When I interact with [feature name]
   Then all touch targets are minimum 44x44 CSS pixels
   And spacing between targets is adequate (8px minimum)
   ```

5. **Responsive & Zoom Support**
   ```gherkin
   Given I zoom the page to 200%
   When I use [feature name]
   Then all content remains visible and functional
   And no horizontal scrolling is required
   And text reflows appropriately
   ```

**Organization-Specific Accessibility Resources:**

If your organization has accessibility guidelines, reference them here. Common resources:
- Internal accessibility documentation
- Design system accessibility patterns
- Component-specific acceptance criteria
- Testing procedures and tools

**Accessibility Testing:**

Include appropriate accessibility testing tools in your Definition of Done:
- [ ] Accessibility audit completed (e.g., Axe, Lighthouse, WAVE)
- [ ] Keyboard navigation verified
- [ ] Screen reader testing completed (e.g., NVDA, JAWS, VoiceOver)
- [ ] Color contrast validated (e.g., WebAIM contrast checker)
- [ ] Touch target sizes verified on mobile devices

---

**Azure DevOps Work Item Creation:**

When creating work items in Azure DevOps:

**CRITICAL: For PBI (Product Backlog Item) creation, use Azure DevOps CLI, NOT MCP**

- **For PBI creation**: Use `az boards work-item create --type "Product Backlog Item"` (CLI command)
  - **Why**: ADO MCP does not support PBI work item type, only Tasks
  - **Benefit**: CLI recognizes PBI type and uses minimal token consumption
  - Even if ADO MCP is configured in settings/mcp.json, use CLI for PBIs

- **For Task creation**: Can use either ADO MCP or CLI (both supported)

**PBI Creation Workflow:**

1. **Create the PBI using Azure DevOps CLI:**
   ```bash
   az boards work-item create \
     --type "Product Backlog Item" \
     --title "[Story Title]" \
     --description "[Story Description with Acceptance Criteria]" \
     --assigned-to "[User]" \
     --area "[Area Path]" \
     --iteration "[Iteration Path]" \
     --tags "BA_CC_WF2.0"
   ```

2. **Automatically create 6 standard subtasks** (as child work items) using CLI:
   
   After PBI is created and user approves, create these 6 subtasks:
   
   ```bash
   # For each subtask, run:
   az boards work-item create \
     --type "Task" \
     --title "[Subtask Name]" \
     --parent [PBI-ID] \
     --area "[Area Path]" \
     --iteration "[Iteration Path]"
   ```
   
   **Required Subtasks (in this order):**
   1. **Investigate** - Research and design approach
   2. **Development** - Implementation of the feature
   3. **Code Review 1** - First round of code review
   4. **Code Review 2** - Second round of code review
   5. **Test Case Design** - Create test scenarios and cases
   6. **Testing** - Execute tests and validate functionality

**Confirmation Protocol:**

- ALWAYS show the user the complete story + subtasks in conversation first
- NEVER auto-create work items without explicit user approval
- Ask: "Would you like me to create this PBI with 6 subtasks in Azure DevOps?"
- After user approves: Create PBI using CLI, then auto-create all 6 subtasks
