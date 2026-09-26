---
layout: default
title: List yours
---

# List your implementation

Any host, client, relay or SDK that passes the Open Agent Link conformance suite can be listed on [openagent.link](https://openagent.link). Listing is free and open to everyone.

## 1. Pass the suite

Build `oal-conformance` from the [reference repository](https://github.com/NeboLoop/nebo-link/tree/main/crates/oal-conformance) and run it against your project.

```sh
# A host
oal-conformance host wss://<relay>/oal/hosts/<host id> --code <CODE> --agent <agent id>

# A client or SDK: point it at the fake host this serves
oal-conformance client --listen 127.0.0.1:7878 --code K7QM-3XRD
```

Every example must pass. Save the full output somewhere public, such as a CI run or a gist.

## 2. Open a pull request

Add one file, `_data/implementations/<your-project>.yml`, to [openagentlink.github.io](https://github.com/openagentlink/openagentlink.github.io). Copy the fields from [`_example.yml.txt`](https://github.com/openagentlink/openagentlink.github.io/blob/main/_data/implementations/_example.yml.txt). A check validates the file. A maintainer confirms the suite output and merges.

Prefer not to open a pull request? Use the [listing form](https://github.com/openagentlink/openagentlink.github.io/issues/new?template=implementation.yml).

## Staying listed

When a new suite version ships, run it again and update `conformance`. The grid shows which version each project passed.
