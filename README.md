# Journal LaTeX Templates

MarkFlow AW 的期刊模板导入包。每个 ZIP 以期刊全称命名，解压后可直接编译，也可在 MarkFlow AW 中导入使用。

## 模板

| ZIP | 类型 | 来源 | 许可 |
|---|---|---|---|
| IEEE Transactions (Generic).zip | IEEE Transactions 通用 | CTAN `ieeetran` | LPPL-1.3c |
| IEEE Transactions on Instrumentation and Measurement.zip | IEEE TIM 专用 | CTAN `ieeetran` + TIM 要求 | LPPL-1.3c |
| IEEE Sensors Journal.zip | IEEE Sensors 专用 | CTAN `ieeetran` + 期刊要求 | LPPL-1.3c |
| Elsevier Journals (Generic).zip | Elsevier 通用 | CTAN `elsarticle` | LPPL-1.3c |
| Measurement (Elsevier).zip | Measurement 专用 | CTAN `elsarticle` + 期刊要求 | LPPL-1.3c |
| ACM Transactions (Generic).zip | ACM 通用 | CTAN `acmart` | LPPL-1.3c |
| Physical Review Letters.zip | APS / PRL | CTAN `revtex` | LPPL-1.3c |
| Journal of the American Chemical Society.zip | ACS / JACS | CTAN `achemso` | LPPL-1.3c |
| RSC Advances.zip | RSC | CTAN `rsc` | LPPL-1.3c |
| Springer Nature Journals (Generic).zip | Springer Nature 通用 | Springer Nature | LPPL-1.3c |
| Nature Portfolio (Springer Nature).zip | Nature Portfolio 专用 | Springer Nature `sn-jnl` | LPPL-1.3c |
| AIP Publishing Journals (Generic).zip | AIP 通用 | CTAN `revtex`（AIP substyle） | LPPL-1.3c |
| IOP Publishing Journals (Generic).zip | IOP 通用 | IOP `iopart` | LPPL-1.3c |
| Cell (Generic).zip | Cell 样式 | CTAN `cell` | public domain |

全部模板的 `main.tex` 已用 TeX Live 2026 + `latexmk -pdf` 编译通过。

## 使用

解压 ZIP 到任意目录，编译 `main.tex`。

## 模板包结构

```text
<期刊全称>.zip
├─ manifest.json
├─ main.tex
├─ README.md
├─ LICENSE.txt
└─ .cls / .sty / .bst / .bib / 图片 / 字体等支撑文件
```

`manifest.json` 字段：`name`（期刊全称）、`entry`（入口 `.tex`）、`scope`（generic / journal-specific）、`publisher`、`description`、`source`、`license`、`version`。

## 许可

- 本仓库的 README 与 ZIP 内 `manifest.json`：MIT，见 [LICENSE](LICENSE)。
- 各模板文件遵循模板内 `LICENSE.txt` 所列许可；多数为 LPPL-1.3c，全文见 [LICENSES/LPPL-1.3c.txt](LICENSES/LPPL-1.3c.txt)。
- 模板版权归原发布者所有；来源见上表。
