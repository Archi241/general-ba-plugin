---
name: ba
description: Smart BA orchestrator that routes requests to specialized agents automatically
model: haiku
---

# BA Orchestrator Skill

Smart business analysis orchestrator that routes your requests to specialized agents using **semantic understanding**.

**Usage examples:**
- `/ba` - Show capabilities menu
- `/ba create stories for invoice approval`
- `/ba I need to document the API`
- `/ba show me the login workflow`
- `/ba what are the requirements gaps?`
- `/ba here's a meeting transcript to analyze`

---

**Agent to invoke:** ba-orchestrator

**Instructions for ba-orchestrator:**

The user has invoked the BA skill with this request:
{{USER_INPUT}}

## Routing Logic: Use Semantic Understanding

**IMPORTANT:** Use **semantic understanding**, NOT keyword matching. Understand user intent naturally.

### Available Skills & Their Intents:

| Skill | User Intent (Semantic) | Example Requests |
|-------|------------------------|------------------|
| **story** | Create/generate user stories | "create stories", "I need PBIs", "write user stories", "generate stories for X" |
| **review-story** | Review/validate existing PBIs | "review PBI 12345", "check this story", "validate this PBI", "is this story ready?" |
| **diagram** | Visualize flows/architecture | "show workflow", "create diagram", "visualize the flow", "how does X work?" |
| **analyze-requirements** | Analyze requirement quality | "check requirements", "review these requirements", "are these requirements complete?" |
| **analyze-transcript** | Extract insights from meetings | "analyze transcript", "meeting notes", "what did we discuss?", "extract requirements from call" |
| **api-docs** | Document APIs/endpoints | "document API", "create OpenAPI spec", "API documentation", "what are the endpoints?" |
| **code-qa** | Answer codebase questions | "how does X work?", "where is Y defined?", "explain this code", "what does Z do?" |
| **prototype** | Build working prototypes | "create prototype", "build a demo", "proof of concept", "working example" |
| **ux-assessment** | Evaluate UI/UX designs | "review UI", "check accessibility", "UX feedback", "analyze this design" |

## Your Task:

1. **If USER_INPUT is empty or just "/ba":**
   - Present capabilities menu using AskUserQuestion
   - Guide through sub-options
   - Route after selection

2. **If USER_INPUT contains a request:**
   - **Semantically understand** the user's intent (not keyword match!)
   - Map intent to appropriate skill (see table above)
   - Route directly using the Skill tool
   - Examples:
     - "I need PBIs for checkout" → Invoke skill: story
     - "Show me how login works" → Invoke skill: diagram
     - "This is a transcript from our meeting" → Invoke skill: analyze-transcript

3. **After agent completes:**
   - Present results
   - Offer logical next steps

Be intelligent and natural. Understand variations, synonyms, and context.
