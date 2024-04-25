# GitHub Action for Sqitch

This GitHub Action allows you to run Sqitch commands directly within your GitHub Actions workflows. Sqitch is a database change management tool that facilitates the application of schema changes or versions to your database.

## Features

- **Custom Commands**: Run any Sqitch command (like deploy, revert, verify) directly in your workflows.
- **Flexible**: Works with any database that Sqitch supports.
- **Simple Configuration**: Easy to set up with minimal configuration.

## Inputs

### `command`

**Required** The Sqitch command you want to run, including all necessary options.

### `target`

**Required** The target database to run the commands against. This should usually be a secret that holds your database connection string or a reference to a pre-configured target in your Sqitch configuration.

## Usage

Here's an example of how to use this action:

```yaml
name: Database Migration Workflow
on:
  push:
    branches:
      - main

jobs:
  migrate_database:
    runs-on: ubuntu-latest
    name: Apply Sqitch Changes
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run Sqitch Commands
        uses: stepandel/sqitch-action@v1.0.0
        with:
          command: "deploy --verify"
          target: ${{ secrets.SQITCH_TARGET }}
```
