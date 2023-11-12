# Auto Firmware Dumper
It allows you to create ROM dumps using GitHub actions. It uses DumprX when creating dumps.
DumprX: https://github.com/DumprX/DumprX

## Requirements
- ROM Link [mediafire | mega.nz | gdrive | AndroidFileHost OR Directly download link]
- GitHub token (I will explain)
- Patience

## Instruction for use
- GitLab Account: Setup your Access Token, and make a copy of your token name and the token key itself.
- Fork this repository.
- Go to Settings of the forked repository.
- Then go to Secrets and Variables, and tap Action in dropdown choices.
- Tap New Repository Secrets;
Add this:
`GITLAB_TOKEN_NAME`
`<paste here your token name>`
- Then tap Add Secrets.
- Tap New Repository Secrets, again;
Add this:
`GITLAB_TOKEN`
`<paste here your access token>`
- Then tap Add Secrets.
- If actions are not enabled, enable them from settings.
- Go to: this repository > Actions > All workflows> Auto Firmware Dumper by @YZBruh > Run workflows > Fill in the requested information.
- When the process is completed, you will have the following among your repositories: dump_`<brand>`_`<device>`. And if you've approved it, the repository of device trees you've approved. You will understand when you look.

## Small explanations and notes
- Any deficiencies or problems on the dump are caused by Stock ROM.
- I'm still developing it. But still good.
- If there is a capital letter in the device code name, do not write it that way. Make all letters lowercase.
- Report problems.
- Make sure you fill in the information correctly.
- The repository created will be private, not public. You can change this.
- Set the action entries to `true` for the trees you want to be loaded separately.
- You can upload the ROM dump either by creating a GitLab repository or as a release release on the GitHub local (this repository). In cases where the ROM size is large, I recommend publishing as GitHub releases. To select it as a repository, write in the relevant section of the entries: `repo` and to compress it: `compress`.
- Telegram: @YZBruh
