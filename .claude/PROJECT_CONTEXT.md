# Project Context Template

## 📋 How to Use This File

This file helps Claude understand your project's domain, entities, and terminology.
**Fill in the sections below** to customize the BA plugin for your project.

**💡 Tip:** You can start with just the basics and expand as needed!

---

## Core Entities

Define your main domain entities here. Include:
- Entity name
- Brief description
- Example usage in user stories

### Example: [EntityName]
Brief description of what this entity represents.

**Example:** "As a [Persona], I want to [action] a [entity]..."

**Add your entities below:**

### [Entity 1]
_Description..._

**Example:** _"As a..."_

### [Entity 2]
_Description..._

**Example:** _"As a..."_

### [Entity 3]
_Description..._

**Example:** _"As a..."_

---

## Personas

Define the key user roles/personas in your system. Include:
- Persona name
- Their responsibilities
- When to use this persona in stories

### Example: [Persona Name]
What this user does, their responsibilities.
**Use this for:** [Types of stories]

**Add your personas below:**

### [Persona 1]
_Responsibilities..._
**Use this for:** _Story types..._

### [Persona 2]
_Responsibilities..._
**Use this for:** _Story types..._

### [Persona 3]
_Responsibilities..._
**Use this for:** _Story types..._

---

## Business Terminology

Document your project's specific terminology to ensure consistency.

| ✅ Use This (Preferred) | ❌ Not This (Avoid) | Notes |
|-------------------------|---------------------|-------|
| [Term1] | [Synonym] | _Why we use Term1..._ |
| [Term2] | [Synonym] | _Why we use Term2..._ |
| [Term3] | [Synonym] | _Why we use Term3..._ |

**Examples:**
- User → Customer (we call them "Users" not "Customers")
- Order → Purchase (we call them "Orders")
- Account → Profile (we call them "Accounts")

---

## Domain-Specific Rules

Document any business rules or domain constraints that affect user stories.

### Example: Order Processing
- Orders can only be cancelled within 24 hours
- Minimum order value is $10
- Premium users get free shipping

**Add your rules below:**

### [Domain Area 1]
- _Rule 1..._
- _Rule 2..._
- _Rule 3..._

### [Domain Area 2]
- _Rule 1..._
- _Rule 2..._

---

## Common Workflows

Document key workflows that frequently appear in user stories.

### Example: User Registration
1. User submits registration form
2. System validates email and password
3. Confirmation email sent
4. User clicks link to activate account
5. User logged in automatically

**Add your workflows below:**

### [Workflow 1]
1. _Step 1..._
2. _Step 2..._
3. _Step 3..._

### [Workflow 2]
1. _Step 1..._
2. _Step 2..._
3. _Step 3..._

---

## 🎯 Quick Start

1. **Fill in Core Entities** - Start with 3-5 main entities
2. **Define Personas** - Add 3-5 key user roles
3. **Document Terminology** - Add any project-specific terms
4. **Start using `/ba`** - The plugin will use this context automatically!

---

## 💡 Tips

- **Start small:** You don't need to fill everything at once
- **Iterate:** Add more as you discover gaps
- **Keep it updated:** Review quarterly or when domain changes
- **Be specific:** The more detail, the better Claude understands your domain
- **Use examples:** Real examples help clarify concepts

---

## Example: E-commerce Project

Here's a filled example for reference:

### Core Entities
- **Order**: Customer purchase with line items and payment
- **Product**: Item available for purchase
- **Cart**: Temporary collection of products before checkout
- **Customer**: Registered user who can place orders

### Personas
- **Customer**: Browses products, adds to cart, places orders
- **Admin**: Manages products, views orders, handles refunds
- **Support Agent**: Assists customers, processes returns

### Business Terminology
| ✅ Use This | ❌ Not This |
|------------|------------|
| Order | Purchase |
| Customer | User |
| Product | Item |
| Cart | Basket |
