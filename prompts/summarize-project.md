# Summarize Project

Analyze this project and provide a comprehensive summary following these guidelines:

## Analysis Steps
1. **Explore the project structure** - examine directories, key files, and organization
2. **Identify the technology stack** - programming languages, frameworks, libraries, build tools
3. **Understand the purpose** - read README, package files, and main source files
4. **Analyze architecture** - identify entry points, main modules, and design patterns

## Summary Structure

Provide a structured summary with these sections:

### Project Overview
- **Name**: Project name (from package.json, README, or repository)
- **Purpose**: Brief description of what the project does (1-2 sentences)
- **Type**: (e.g., CLI tool, web application, library, API service, mobile app)

### Technology Stack
- **Primary Language(s)**: Main programming languages used
- **Frameworks/Libraries**: Key dependencies and frameworks
- **Build System**: (e.g., CMake, npm, Maven, cargo)
- **Testing Framework**: If tests are present
- **Other Tools**: Linters, formatters, CI/CD, etc.

### Project Structure
- **Key Directories**: Brief description of main folders and their purpose
- **Entry Points**: Main executable files or entry points
- **Configuration Files**: Important config files and what they control

### Core Components
List the main modules/components with brief descriptions:
- What each major module does
- Key classes or functions
- How components interact (if evident)

### Development Setup
- **Prerequisites**: Required tools or dependencies to install
- **Build Command**: How to build/compile the project
- **Run Command**: How to execute/start the project
- **Test Command**: How to run tests (if applicable)

### Notable Features
- Highlight any interesting or unique aspects
- Special configurations or optimizations
- Third-party integrations

## Analysis Guidelines
- **Be concise**: Keep descriptions brief but informative
- **Focus on facts**: Base conclusions on actual code and files, not assumptions
- **Prioritize relevance**: Emphasize the most important components
- **Note uncertainties**: If something is unclear, mention it explicitly
- **Check multiple sources**: Verify information across README, code, and config files

## What to Look For
- README.md, CONTRIBUTING.md, docs/
- package.json, Cargo.toml, pyproject.toml, pom.xml, CMakeLists.txt
- Main source directories (src/, lib/, app/, etc.)
- Configuration files (.env, config/, settings.py, etc.)
- Scripts (scripts/, bin/, .github/workflows/)
- Tests (tests/, test/, __tests__/, spec/)

## Output Format
Present the summary in clear Markdown format with proper headings and bullet points. Keep the entire summary focused and readable - aim for thoroughness without overwhelming detail.
