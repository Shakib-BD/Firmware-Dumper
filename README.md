# Auto Firmware Dumper
It allows you to create ROM dumps using GitHub actions. It uses DumprX when creating dumps.
DumprX: https://github.com/DumprX/DumprX

## Requirements
- ROM Link [mediafire | mega.nz | gdrive | AndroidFileHost OR Directly download link]
- GitHub token (I will explain)
- Patience

## Instruction for use
- Fork this repository
- First, obtain Personal access token. You can get your Personal Access Token in account Settings > Developer settings > Personal access token. Tick ​​all the boxes. Copy the token.
- Then, go to repository Settings > Secrets and Variables > Action > New repository secret; in name - DUMP and in secret paste your Personal Access Token.
- Go to: this repository > Actions > All workflows> Auto Firmware Dumper by @YZBruh > Run workflows > Fill in the requested information.
- When the process is completed, you will have the following among your repositories: dump_brand_device. And if you've approved it, the repository of device trees you've approved. You will understand when you look.

## Small explanations and notes
- Any deficiencies or problems on the dump are caused by Stock ROM.
- I'm still developing it. But still good.
- Report problems.
- Make sure you fill in the information correctly.
- Set the action entries to `true` for the trees you want to be loaded separately.
- Telegram: @YZBruh
