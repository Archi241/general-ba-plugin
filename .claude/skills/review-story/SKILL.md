---
name: review-story
description: Review user stories for technical feasibility and functional completeness. Analyzes stories against codebase patterns and provides detailed feedback with improvement suggestions.
user-invocable: true
---

# Story Review Skill

**What to do:** Review the provided user story for technical feasibility, functional completeness, and overall quality.

**Usage:** `/review-story [paste user story]`

---

## 🔄 WORKFLOW: Read Context Files First (Legal Tracker Optimization)

**BEFORE reviewing the story, load Legal Tracker context:**

```
1. Read .claude/PROJECT_CONTEXT.md
   → Validate: Correct entities used (TMatter vs "Case", TAction vs "Task")
   → Validate: Correct personas referenced
   → Validate: Correct terminology
   → Validate: Business rules are properly handled

2. Read .claude/ARCHITECTURE.md
   → Validate: Tech stack is correct (TOF, not EF)
   → Validate: Constraints are followed (no foreign keys, TSer types, etc.)
   → Validate: Architecture patterns match (CQRS for microservices, MVC for monolith)
   → Validate: C# version constraints (7.3 for monolith, modern for microservices)

3. Review story against Legal Tracker patterns from context files
```

---

**Deliverables:**
- Technical feasibility assessment with codebase references
- Functional completeness analysis (acceptance criteria coverage, edge cases, testability)
- Quality assessment (clarity, domain terminology, template compliance)
- **Accessibility compliance validation (WCAG 2.1 AA)**
- Figma accessibility annotation check (if Figma MCP available)
- Subtask validation (ensure all 6 required subtasks are present)
- Prioritized recommendations (Critical → Nice-to-have)
- Revised story version for approval

**Required Subtasks Check:**

Verify the user story includes all 6 required subtasks:

1. ☐ Investigate
2. ☐ Development
3. ☐ Code Review 1
4. ☐ Code Review 2
5. ☐ Test Case Design
6. ☐ Testing

If missing, add them to the revised story version.

---

## 📋 Accessibility Review (Legal Tracker Standards)

**CRITICAL: For UI stories, validate accessibility compliance**

### Step 1: Check Figma Accessibility Annotations (if available)

**If Figma MCP is connected and user provided Figma link:**

1. Use Figma MCP to access the design file
2. Check for accessibility annotations:
   - ARIA labels and roles
   - Keyboard navigation specifications
   - Focus order requirements
   - Screen reader instructions
   - Color contrast ratios
   - Touch target sizes

3. **Validate story includes ACs for each Figma annotation**
   - If Figma specifies aria-label, ensure story has AC for it
   - If Figma shows keyboard flow, ensure story has keyboard navigation AC
   - Flag missing ACs in your review

### Step 2: Validate TR Accessibility Requirements

**Legal Tracker follows WCAG 2.1 Level AA**. For UI stories, verify presence of:

**Required Accessibility Acceptance Criteria:**

✅ **1. Keyboard Navigation AC**
- Must include: Tab/Shift+Tab navigation
- Must include: Focus indicators (min 2px outline)
- Must include: Logical tab order
- Must include: Enter/Space activation

✅ **2. Screen Reader Support AC**
- Must include: ARIA labels for interactive elements
- Must include: Form label associations
- Must include: Error/success message announcements
- Must include: Dynamic content announcements

✅ **3. Color Contrast AC** (WCAG 2.1 AA)
- Must include: 4.5:1 ratio for normal text
- Must include: 3:1 ratio for large text (18pt+/14pt+ bold)
- Must include: 3:1 ratio for UI components
- Must include: 3:1 ratio for focus indicators

✅ **4. Touch Targets AC** (for mobile/tablet features)
- Must include: Minimum 44x44 CSS pixels
- Must include: Adequate spacing (8px minimum)

✅ **5. Responsive & Zoom Support AC**
- Must include: 200% zoom support
- Must include: No horizontal scrolling
- Must include: Text reflow

**Validation Checklist:**

For each UI story, check:
- [ ] Has keyboard navigation AC?
- [ ] Has screen reader support AC?
- [ ] Has color contrast requirements?
- [ ] Has touch target specifications (if mobile)?
- [ ] Has zoom/responsive AC?
- [ ] Definition of Done includes Axe accessibility audit?
- [ ] Definition of Done includes keyboard testing?
- [ ] Definition of Done includes screen reader testing?

**If accessibility ACs are missing:**
- Flag as **CRITICAL** issue in your review
- Add missing ACs to revised story version
- Reference TR Accessibility SharePoint (see link below)
- Include example accessibility AC from Legal Tracker standards

**TR Accessibility SharePoint:**

**Thomson Reuters Digital Accessibility Center of Excellence:**
- **Link**: [Accessibility Component Acceptance Criteria](https://trten.sharepoint.com/:u:/r/sites/intr-digital-accessibility-coe/SitePages/Accessibility-component-acceptance-criteria.aspx?csf=1&web=1&e=M7bchd)
- **Use For**: Validating accessibility acceptance criteria against TR standards
- **Standard**: WCAG 2.1 Level AA compliance requirements

---

**After Completion - Offer Next Steps:**

After reviewing story, ALWAYS ask the user:

> "Would you like me to help with next steps?
>
> 1. **Create Work Items** - Push the reviewed story to Azure DevOps
> 2. **Create Diagrams** - Visualize the workflow with sequence or flowchart diagrams (`/diagram`)
> 3. **Build Prototype** - Create working prototype to validate the story (`/prototype`)
>
> Which would be helpful?"

**How to route:**

- If user chooses "Create Work Items" → Use Azure DevOps **CLI** (not MCP) to create PBI with tag `BA_CC_WF2.0` and all 6 subtasks
  - **CRITICAL**: Use `az boards work-item create --type "Product Backlog Item"` for PBI creation
  - **Why**: ADO MCP does not support PBI work item type
  - After PBI created, auto-create 6 subtasks: Investigate, Development, Code Review 1, Code Review 2, Test Case Design, Testing
- If user chooses "Create Diagrams" → `Skill(skill: "diagram", args: "Create [sequence/flowchart] diagram for: [story workflow]")`
- If user chooses "Build Prototype" → `Skill(skill: "prototype", args: "Build prototype implementing: [story summary]")`
