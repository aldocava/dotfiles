# Dotfiles

## Opencode

Install Opencode (npm):

```powershell
npm install -g opencode
```

Copy your local config into the repo and fill in the API key placeholder.

```jsonc
// config/opencode.jsonc
"CONTEXT7_API_KEY": "<CONTEXT7_API_KEY>"
```

Keep secrets out of the repo.

## Zed

Copy your Zed settings into the repo:

```text
C:\Users\<USERNAME>\AppData\Roaming\Zed\settings.json
```

Stored at `config/zed/settings.json`.

## Oh My Posh

Install Oh My Posh and fonts (PowerShell):

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
oh-my-posh font install
```

Install the required modules (PowerShell):

```powershell
Install-Module -Name Terminal-Icons -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser
```

Add your PowerShell profile snippet to the repo, for example:

```text
config/oh-my-posh/myconfig.ps1
```

Example: source your profile snippet from PowerShell:

```powershell
. "$HOME\dotfiles\config\oh-my-posh\myconfig.ps1"
```
