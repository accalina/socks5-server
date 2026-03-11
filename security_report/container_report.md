```bash
2026-03-11T10:40:44+07:00       INFO    [vulndb] Need to update DB
2026-03-11T10:40:44+07:00       INFO    [vulndb] Downloading vulnerability DB...
2026-03-11T10:40:44+07:00       INFO    [vulndb] Downloading artifact...        repo="mirror.gcr.io/aquasec/trivy-db:2"
87.23 MiB / 87.23 MiB [-------------------------------------------------------] 100.00% 2.97 MiB p/s 30s
2026-03-11T10:41:15+07:00       INFO    [vulndb] Artifact successfully downloaded       repo="mirror.gcr.io/aquasec/trivy-db:2"
2026-03-11T10:41:15+07:00       INFO    [vuln] Vulnerability scanning is enabled
2026-03-11T10:41:15+07:00       INFO    [secret] Secret scanning is enabled
2026-03-11T10:41:15+07:00       INFO    [secret] If your scanning is slow, please try '--scanners vuln' to disable secret scanning
2026-03-11T10:41:15+07:00       INFO    [secret] Please see also https://trivy.dev/v0.63/docs/scanner/secret#recommendation for faster secret detection
2026-03-11T10:41:16+07:00       INFO    Detected OS     family="debian" version="12.7"
2026-03-11T10:41:16+07:00       INFO    [debian] Detecting vulnerabilities...   os_version="12" pkg_num=3
2026-03-11T10:41:16+07:00       INFO    Number of language-specific files       num=0

Report Summary

┌──────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                  Target                  │  Type  │ Vulnerabilities │ Secrets │
├──────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ socks5-server_socks5-build (debian 12.7) │ debian │        0        │    -    │
└──────────────────────────────────────────┴────────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)


📣 Notices:
  - Version 0.69.3 of Trivy is now available, current version is 0.63.0

To suppress version checks, run Trivy scans with the --skip-version-check flag
```