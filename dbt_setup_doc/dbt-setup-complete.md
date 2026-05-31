# dbt Setup — Completed

**Date:** Sunday, May 24, 2026
**Status:** ✅ dbt fully working and verified end-to-end. Setup phase DONE.

---

## What's confirmed working

- **Python:** 3.12.10 from python.org
  Location: `C:\Users\Manikandan\AppData\Local\Programs\Python\Python312`
  Correctly on PATH.
- **dbt:** dbt-core 1.11.11 + dbt-bigquery 1.11.1 — installed and working.
- **`dbt --version`** runs from anywhere (Scripts folder added to `~/.bashrc`).
- **Project:** `credit_risk_dbt` created at `~/credit_risk_dbt` (home folder, **NOT** Desktop).
- **profiles.yml:** hand-written at `~/.dbt/profiles.yml`
  - method: oauth
  - project: `mani-dbt-learning`
  - dataset: `dbt_dev`
  - threads: 1
  - location: US
- **`dbt debug`** → All checks passed.
- **`dbt run`** → built `my_first_dbt_model` (table) + `my_second_dbt_model` (view) in BigQuery `dbt_dev`. Verified visible in BigQuery console.

---

## Key lesson — root cause of the multi-session struggle

A **deleted Anaconda install** left dbt's launcher pointing at a dead Python: `C:\ProgramData\anaconda3\python.exe`. On top of that, **Microsoft Store Python** was hijacking the `python` command.

**The fix:**
1. Disabled Store Python app-execution aliases (Settings → App execution aliases).
2. Installed real Python via `winget install Python.Python.3.12`.
3. `pip install --force-reinstall --no-cache-dir dbt-bigquery` to rebuild the executable against the correct Python.
4. Added Scripts folder to `~/.bashrc` for the short `dbt` command.

**Takeaway:** A successful `pip install` does NOT guarantee a working executable. The **package**, the **launcher (.exe)**, and **PATH** are three separate things — debug them separately.

---

## Workflow

- **Git Bash** → RUN dbt commands (`dbt debug`, `dbt run`, etc.)
- **VS Code** → EDIT model (`.sql`) and config (`.yml`) files.

---

## Next session — Monday 8–9 PM block (pure learning, no setup)

1. Open `credit_risk_dbt` in VS Code, examine the two example model files.
2. Learn what a dbt **model** is, and what `{{ ref() }}` does (why `my_second` depends on `my_first`).
3. Write and run one small change myself.

> I also have a list of questions about dbt saved up to work through.

---

## Note to mentor (paste in new chat)

Pick up from here as my strict accountability mentor. dbt setup is complete and verified. I report **Done / Stuck / Skipped**. Start me on Monday's learning plan above — no setup, straight into understanding models and `ref()`.
