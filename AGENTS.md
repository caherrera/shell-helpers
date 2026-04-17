---
description: Project rules for shell-helpers
---

# Project Rules

## Language Requirements

### Comments MUST be in English
- All comments in code files MUST be written in English
- Function documentation MUST be in English
- Variable names SHOULD be in English
- Error messages SHOULD be in English

### Code Style
- Follow existing code style and patterns
- Use semantic function names
- Maintain backward compatibility when possible

### File Organization
- Keep related functions grouped together
- Use consistent section headers
- Maintain proper spacing and indentation

### Testing
- All new functions MUST have tests
- Tests SHOULD be in the tests/ directory
- Use descriptive test names

### Git Conventions
- Use conventional commit format: [TYPE]: [KEY] Description
- Types: FEAT, FIX, DOC, ENH, REF, TST, SEC, INFR, BLD
- Include JIRA key when applicable: [PROJ-123]

### Dependencies
- Check for required commands before use
- Provide helpful error messages for missing dependencies
- Use existing helper functions when available

## Editor Compatibility

This rules file is compatible with:
- VSCode (via .vscode/settings.json or workspace settings)
- Cursor (via .cursor/rules or workspace settings)
- Windsurf (via .windsurf/rules.md)
- Antigravity (via project configuration)

## Enforcement

These rules should be enforced by:
- Linting tools (shellcheck, etc.)
- Code review processes
- Editor integrations
- CI/CD pipelines
