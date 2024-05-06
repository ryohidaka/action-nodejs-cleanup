# Node.js Cleanup

[![release](https://badgen.net/github/release/ryohidaka/nodejs-cleanup)](https://github.com/ryohidaka/nodejs-cleanup/releases/)
[![Test Action](https://github.com/ryohidaka/nodejs-cleanup/actions/workflows/main.yml/badge.svg)](https://github.com/ryohidaka/nodejs-cleanup/actions/workflows/main.yml)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/B0B6TVH92)

A GitHub Action that cleanup Node.js template configures.

## Usage

```yml
on:
  push:
    branches:
      - main

jobs:
  template-cleanup:
    name: Template Cleanup
    runs-on: ubuntu-latest
    if: github.event.repository.name != 'nodejs-cleanup'
    permissions:
      contents: write
    steps:
      # Check out current repository
      - name: Fetch Sources
        uses: actions/checkout@v4

      # Cleanup project
      - name: Cleanup
        uses: ryohidaka/nodejs-cleanup@v0.1.0
        with:
          description: "new description"
          version: "1.0.0"
```

## Inputs

| Input         | Required | Default | Description                                   |
| ------------- | -------- | ------- | --------------------------------------------- |
| `description` |          |         | The description of the project.               |
| `version`     |          | `0.0.0` | The version of the project.                   |
| `email`       |          |         | The email address to be used in the project.  |
| `bugs-url`    |          |         | The URL where the project's bugs are tracked. |
| `homepage`    |          |         | The URL of the project's homepage.            |

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
