# 自动固件转储器
它允许您使用GitHub操作创建ROM转储。 它在创建转储时使用DumprX。 DumprX：https://github.com/DumprX/DumprX
## 要求
- ROM链接[mediafire|mega.nz /gdrive/AndroidFileHost或直接下载链接]
- GitHub令牌（我会解释）
- 耐心
## 使用说明
- Fork此存储库
- 如果操作未打开，请在设置中激活它。
- 首先，获取个人访问令牌。 您可以在帐户设置>开发人员设置>个人访问令牌中获取个人访问令牌。 勾选所有的框。 复制令牌。
- 然后，转到repository Settings>Secrets and Variables>Action>New repository secret;在name-DUMP和in secret粘贴您的个人访问令牌。
- 转到：此存储库>操作>所有工作流>自动固件转储器@YZBruh>运行工作流>填写请求的信息。
- 当该过程完成后，您的存储库中将有以下内容：dump_brand_device。 如果你已经批准了它，你已经批准了设备树的存储库。 你看了就明白了。
## 小解释和注意事项
- 转储上的任何缺陷或问题都是由库存ROM引起的。
- 我还在开发它。 但仍然很好。
- 报告问题。
- 确保您正确填写信息。
- 对于要单独加载的树，将操作条目设置为true。
- 电报：@YZBruh
