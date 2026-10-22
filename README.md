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

Every pull request builds the `.vsix` package in GitHub Actions.

Every merge to `master` releases automatically:

1. The version in `package.json` is bumped based on the merged commit messages:
   - `feat!:` or `BREAKING CHANGE` → major (3.0.0 → 4.0.0)
   - `feat:` → minor (3.0.0 → 3.1.0)
   - anything else → patch (3.0.0 → 3.0.1)
2. The bump is committed to `master` and tagged `vX.Y.Z`.
3. The extension is published to the VS Code Marketplace, and a GitHub release is created with the `.vsix` attached.

To choose a version yourself, set it in `package.json` in your pull request. If that version has no tag yet, it is released as is.

Publishing needs a `VSCE_PAT` repository secret: an Azure DevOps personal access token with the **Marketplace › Manage** scope for the `Ashinberish` publisher.
