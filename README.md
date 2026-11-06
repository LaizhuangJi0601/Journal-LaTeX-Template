# Journal LaTeX Templates

面向 **MarkFlow AW / MDRE**「AI 期刊模板」功能的 LaTeX 模板包集合。模板按期刊（或出版社通用模板）打包为 ZIP，ZIP 文件名即期刊全称，可直接在应用内导入。

- 不内置期刊模板；本仓库提供可下载的 ZIP。
- 只收录可再分发的 LPPL 模板；IEEE Access、Wiley 等出版社版权模板不进入本仓库，见 [official-sources.md](official-sources.md)。
- 每个模板包含 `manifest.json`、`README.md`、`LICENSE.txt` 和可编译的 `main.tex`。

## 模板清单

| ZIP | 类型 | 来源 | 许可 |
|---|---|---|---|
| IEEE Transactions (Generic).zip | IEEE Transactions 通用 | CTAN `ieeetran` | LPPL-1.3c |
| IEEE Transactions on Instrumentation and Measurement.zip | 期刊专用（基于通用 IEEEtran） | CTAN `ieeetran` + TIM 要求 | LPPL-1.3c |
| IEEE Sensors Journal.zip | 期刊专用（基于通用 IEEEtran） | CTAN `ieeetran` + 期刊要求 | LPPL-1.3c |
| Elsevier Journals (Generic).zip | Elsevier 通用 | CTAN `elsarticle` | LPPL-1.3c |
| Measurement (Elsevier).zip | 期刊专用（基于 elsarticle） | CTAN `elsarticle` + 期刊要求 | LPPL-1.3c |
| ACM Transactions (Generic).zip | ACM 通用 | CTAN `acmart` | LPPL-1.3c |
| Physical Review Letters.zip | APS / PRL | CTAN `revtex` | LPPL-1.3c |
| Journal of the American Chemical Society.zip | ACS / JACS | CTAN `achemso` | LPPL-1.3c |
| RSC Advances.zip | RSC | CTAN `rsc` | LPPL-1.3c |
| Springer Nature Journals (Generic).zip | Springer Nature 通用 | Springer Nature + CTAN | LPPL-1.3c |
| Nature Portfolio (Springer Nature).zip | Nature Portfolio 专用 | Springer Nature `sn-jnl`（`sn-nature`） | LPPL-1.3c |
| AIP Publishing Journals (Generic).zip | AIP 通用 | CTAN `revtex`（AIP substyle） | LPPL-1.3c |
| IOP Publishing Journals (Generic).zip | IOP 通用 | `iopart`（IOP） | LPPL-1.3c |
| Cell (Generic).zip | Cell 社区样式 | CTAN `cell` | public domain |

所有公开 ZIP 位于 `dist/`；也可从 [Releases](https://github.com/LaizhuangJi0601/Journal-LaTeX-Template/releases) 下载。`templates/` 是解包后的源目录，便于检查与重新打包；`index.json` 提供模板清单、下载路径与 SHA-256，`SHA256SUMS.txt` 提供校验值。

> 已验证：上述 14 个公开模板的 `main.tex` 均用 TeX Live 2026 + `latexmk -pdf` 编译通过（2026-11-06）。

## 未包含的出版社模板

IEEE Access、Wiley、Science、MDPI、Taylor & Francis、Optica 等模板的版权或许可不明确，**未放入本仓库**；请从 [official-sources.md](official-sources.md) 的官方页面下载后导入。本地副本可放在 `proprietary/`（已加入 `.gitignore`，不会被提交）。

## IEEE Transactions 说明

- 多数 IEEE Transactions / Journals / Letters 使用 **IEEEtran 通用模板**；本仓库的 `IEEE Transactions (Generic).zip` 可直接作为起点。
- **IEEE TIM**、**IEEE Sensors Journal** 另提供期刊专用包，仍基于 IEEEtran，附 `requirements.md`。
- **IEEE Access** 使用独立的 `ieeeaccess.cls`，官方模板未随本仓库分发，见 [official-sources.md](official-sources.md)。
- 若目标期刊有特殊要求，请用 [IEEE Template Selector](https://template-selector.ieee.org/) 选择该期刊后下载最新模板。

## 在 MarkFlow AW 中导入

1. 打开 **设置 → AI → 期刊模板**。
2. 选择 **导入 ZIP**，选中 `dist/` 下的模板包。
3. ZIP 文件名会作为期刊全称；同名模板会提示覆盖或取消，不保留两份。
4. 在 AI 面板的「转为期刊 TeX」任务中选择模板。

## 模板包格式

```text
<Journal Full Name>.zip
├─ manifest.json
├─ main.tex
├─ README.md
├─ LICENSE.txt / NOTICE.txt
└─ 模板支撑文件（.cls/.sty/.bst/.bib/图片/字体等）
```

`manifest.json` 字段：

| 字段 | 说明 |
|---|---|
| `name` | 期刊全称 |
| `entry` | 入口 `.tex` 文件名 |
| `scope` | `generic`（出版社通用）或 `journal-specific`（期刊专用） |
| `publisher` | 出版社 |
| `description` | 模板说明 |
| `source` | 官方或 CTAN 来源 |
| `license` | 许可证 |
| `version` | 打包日期 |
| `base` | 期刊专用模板所基于的通用模板（可选） |

支持文件：`.tex`、`.cls`、`.sty`、`.bib`、`.bst`、`.bbx`、`.cbx`、`.cfg`、`.def`、`.clo`、`.fd`、图片、字体、`.md`/`.txt` 说明；不接受可执行/脚本文件。

## 重新打包

```powershell
pwsh -NoProfile -File scripts/pack.ps1
```

## 许可

- 本仓库的 README、manifest、打包脚本：MIT，见 [LICENSE](LICENSE)。
- 各模板的 `.cls/.sty/.bst` 与样例文件遵循其原始许可证（多为 LPPL-1.3c），见各模板内 `LICENSE.txt` 与 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。
- 出版社版权模板（IEEE Access、Wiley 等）不在本仓库内，请从官方页面下载后导入。
