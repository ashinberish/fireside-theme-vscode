<p align="center">
  <img alt="Fireside theme logo" src="./assets/icon.png" width="80" />
 </p>
 <h1 align="center">
  Fireside Theme for VS Code
  </h1>
  <p align="center">
A cosy light theme for Visual Studio Code: white editor, warm ivory chrome and ember orange accents
</p>
<img alt="Screenshot" src="./assets/Screenshot.png" />

## Installation

1. Open Extensions in Visual Studio Code in the sidebar panel.
2. Search for "Fireside Theme"
3. Click on "Install".
4. File > Preferences > Color Theme > "Fireside"

## Releasing

Every push and pull request builds the `.vsix` package in GitHub Actions.

To publish a new version to the VS Code Marketplace:

1. Bump `version` in `package.json` and add an entry to `CHANGELOG.md`.
2. Commit, then tag the commit with the same version and push the tag:
   ```sh
   git tag v3.0.0
   git push origin v3.0.0
   ```
3. The workflow publishes to the Marketplace and creates a GitHub release with the `.vsix` attached.

Publishing needs a `VSCE_PAT` repository secret: an Azure DevOps personal access token with the **Marketplace › Manage** scope for the `Ashinberish` publisher.
