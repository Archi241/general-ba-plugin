---
name: ux-assessment
description: Evaluate UI designs and mockups for UX quality, accessibility, and design system compliance
user-invocable: true
model: sonnet
---

# UX Assessment Skill

Evaluates UI designs, mockups, and wireframes for:
- Usability and UX quality
- Accessibility (WCAG compliance)
- Design system alignment (Saffron for Tracker)
- Interaction patterns and flows

**Usage:**
- `/ux-assessment` [attach screenshot/Figma link]
- "Review this UI design" [paste image]
- "Check accessibility for this interface"

**What it analyzes:**
- Visual hierarchy and layout
- Navigation and interaction patterns
- Form design and input validation
- Error handling and feedback
- Mobile responsiveness
- Accessibility compliance
- Design system consistency

**Output:**
- Scored assessment (0-100)
- Specific issues found
- Improvement recommendations
- Accessibility violations
- Design system compliance check

---

**Agent to invoke:** ux-assessment

**Instructions for agent:**

The user wants a UX assessment.

**User's request:**
{{USER_INPUT}}

**Your task:**

1. Analyze the provided UI (screenshot, Figma, mockup)
2. Evaluate against UX best practices and accessibility standards
3. Check Saffron design system compliance (for Tracker UIs)
4. Provide scored assessment with specific feedback
5. Recommend improvements

Be thorough but concise. Focus on actionable insights.
