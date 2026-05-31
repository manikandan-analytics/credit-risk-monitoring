# Credit Risk Monitoring Framework

A practical framework for monitoring credit scorecard models in production — covering distribution drift, score stability, and discrimination decay over time.

Built with public lending data to demonstrate techniques used in real fintech credit risk monitoring.

---

## Why this exists

Credit scorecards degrade silently. A model that was 0.65 Gini at deployment can drift to 0.45 in 18 months, and unless someone is monitoring it, the business finds out only when delinquencies spike. This repo implements the standard monitoring toolkit:

- **PSI (Population Stability Index)** — has the score distribution shifted vs. the training population?
- **CSI (Characteristic Stability Index)** — which input features are driving the drift?
- **Gini / KS** — is the model still separating good and bad customers?
- **Feature-level monitoring** — missing rates, averages, medians per feature, per snapshot

## Tech stack

- **Python** — pandas, numpy, scikit-learn, matplotlib
- **SQL / BigQuery** — for production-style monitoring queries
- **Jupyter** — exploration and reporting

## Repo structure

credit-risk-monitoring/
├── data/          # public datasets (gitignored)
├── notebooks/     # exploration and analysis
├── src/           # reusable Python modules
├── sql/           # BigQuery monitoring queries
└── docs/          # methodology notes

## Status

🚧 Work in progress — building out modules incrementally.

- [ ] PSI calculation module
- [ ] CSI calculation module
- [ ] Gini / KS evaluation
- [ ] Feature-level monitoring (missing rate, distribution stats)
- [ ] BigQuery production query templates
- [ ] End-to-end monitoring notebook on LendingClub data

## About me

I'm a Data Analyst working in fintech / lending, building credit risk and scorecard monitoring systems in production.