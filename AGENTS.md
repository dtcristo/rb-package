# Agents

Guidelines for AI agents working on this codebase.

- Write tests for new behaviour; run existing tests before committing.
- If you only changed an example, only run that example's tests.
- Run targeted tests as you go for fast feedback; run the full suite once before committing.
- Whenever adding new features/functionality, update complex example with support for it (if appropriate).
- Update relevant documentation (README, USAGE, ARCHITECTURE, TODO).
- Keep README concise — detailed usage belongs in USAGE.md.
- Keep documentation minimal — don't be wordy.
- Consistent style with existing code and docs.
- Commit as you go with descriptive messages.
- Don't over-engineer — keep it simple.
- When multiple implementations or design choices exist, present a menu to the user with your recommendation.
- Run `RUBY_BOX=1 bundle exec rake` to run all tests (unit, examples).
- Run `RUBY_BOX=1 bundle exec rake test` for unit tests only.
- Run `RUBY_BOX=1 bundle exec rake example:minimal` for a specific example.
- Run `bundle exec rake format` to format code after every change.
- Fix any warnings.
- Use sub-agents where appropriate.
- Never bump version or publish gem.
