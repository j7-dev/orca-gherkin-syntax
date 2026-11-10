# Gherkin

Syntax highlighting for Gherkin `.feature` files (Cucumber, Behave, SpecFlow, …) in Orca.

Highlights:

- Section keywords: `Feature`, `Rule`, `Background`, `Scenario`, `Scenario Outline`, `Examples`, …
- Step keywords: `Given`, `When`, `Then`, `And`, `But`, `*`
- Chinese keywords (Traditional and Simplified): `功能`、`規則`、`背景`、`場景`、`場景大綱`、`例子`、`假設`、`當`、`那麼`、`而且`、`但是`, …
- `@tags`, `# comments`, `# language:` directive
- `"strings"`, `'strings'`, `「strings」`, `<placeholders>`, numbers
- Data tables and doc strings (`"""` / ```` ``` ````, with optional content type)

Try it with the files in `samples/`.

The grammar in `syntaxes/` is original work, released under the MIT License (see `LICENSE`).

## Develop

```sh
orca plugin validate . --json
orca plugin dev watch . --json    # loads this folder into Orca; Ctrl-C unloads it
```

Orca names the publisher after where the plugin is installed from: the GitHub or GitLab owner of
its repository, or `local` for a folder. See
https://github.com/stablyai/orca/blob/main/docs/reference/plugin-authoring.md.
