# Contributing to ekg-rs

Thank you for your interest in contributing! This project uses
[Angular Conventional Commits](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)
(also known as the
[Conventional Commits](https://www.conventionalcommits.org/)
specification) and [Cocogitto](https://github.com/cocogitto/cocogitto)
for automated changelog generation.

## Commit Message Format

We follow the **Angular Conventional Commits** specification. Each
commit message should be structured as follows:

```text
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature (appears in changelog)
- **fix**: A bug fix (appears in changelog)
- **docs**: Documentation changes (appears in changelog)
- **refactor**: Code refactoring (appears in changelog)
- **perf**: Performance improvements (appears in changelog)
- **build**: Changes to build system (appears in changelog)
- **revert**: Reverts a previous commit (appears in changelog)
- **style**: Code style changes (omitted from changelog)
- **test**: Adding or updating tests (omitted from changelog)
- **ci**: CI/CD changes (omitted from changelog)
- **chore**: Other changes (omitted from changelog)

### Scope (Optional)

The scope provides additional context:

- `error`: Changes to ekg-error crate
- `identifier`: Changes to ekg-identifier crate
- `metadata`: Changes to ekg-metadata crate
- `sparql`: Changes to ekg-sparql crate
- `util`: Changes to ekg-util crate
- `docs`: Documentation
- `deps`: Dependency updates

### Examples

```bash
# Feature commits
feat(identifier): add new identifier type
feat(sparql): add support for SPARQL 1.1 queries

# Bug fix commits
fix(error): correct error handling in async contexts
fix(util): handle missing environment variables

# Documentation commits
docs: update README with crate overview
docs(api): improve rustdoc for identifier types

# Refactoring commits
refactor(metadata): simplify metadata structure
refactor: extract common error handling logic

# Chore commits (won't appear in changelog)
chore: update dependencies
test: add tests for identifier parsing
ci: update GitHub Actions workflow
```

## Breaking Changes

For breaking changes, add `!` after the type/scope and include a
`BREAKING CHANGE:` section in the footer:

```bash
feat(identifier)!: change identifier format

BREAKING CHANGE: Identifier format changed from
string to structured type
```

## Development Workflow

### 1. Fork and Clone

```bash
git clone git@github.com:YOUR_USERNAME/ekg-rs.git
cd ekg-rs
```

### 2. Create a Branch

```bash
git checkout -b feat/my-new-feature
# or
git checkout -b fix/bug-description
```

### 3. Make Changes

- Write code
- Add tests
- Update documentation
- Ensure tests pass: `cargo test`
- Ensure linting passes: `cargo clippy`
- Format code: `cargo fmt`

### 4. Commit Changes

Use Angular Conventional Commits format:

```bash
git add .
git commit -m "feat(identifier): add new feature"
```

**Tip**: Install Cocogitto locally to validate commits:

```bash
cargo install cocogitto
cog check  # Validate commits
```

### 5. Push and Create Pull Request

```bash
git push origin feat/my-new-feature
```

Then create a Pull Request on GitHub.

## Releasing a New Version

Only maintainers can release new versions. The process is automated:

### 1. Update Version in Cargo.toml

```bash
# Edit Cargo.toml and bump the version
vim Cargo.toml  # Change version = "0.1.0" to "0.1.1"
```

### 2. Commit the Version Bump

```bash
git add Cargo.toml
git commit -m "chore: bump version to 0.1.1"
git push origin main
```

### 3. Automatic Release Process

When the version in `Cargo.toml` changes, the CI workflow will
automatically:

1. ✅ Run all checks (format, clippy, build, test)
2. 📝 Generate changelog using Cocogitto (from conventional commits)
3. 📌 Create a git tag (e.g., `v0.1.1`)
4. 🎉 Create a GitHub Release with the changelog
5. 📦 Publish to crates.io
6. 📦 Build and upload binaries for all platforms

**No manual tagging required!** The workflow detects version changes
and handles everything.

## Changelog Generation

The changelog is generated automatically from commit messages:

- **Included**: `feat`, `fix`, `docs`, `refactor`, `perf`, `build`,
  `revert`
- **Excluded**: `style`, `test`, `ci`, `chore`

This encourages meaningful commit messages and creates a clean,
user-focused changelog.

## Code Review

All contributions go through code review:

- Ensure CI passes (all checks must be green)
- Follow Rust best practices
- Add tests for new features
- Update documentation
- Use Angular Conventional Commits format

## Questions?

Feel free to open an issue for questions or discussions!
