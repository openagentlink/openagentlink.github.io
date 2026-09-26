---
layout: default
title: Overview
---

<span class="status">Version 0.1 · draft</span>

# Open Agent Link

<p class="lede">An open protocol for reaching a coding agent on one computer from anywhere else: a phone, a web app, a script, or another agent.</p>

<div class="links">
<a class="btn primary" href="/spec/0.1/">Read the spec</a>
<a class="btn" href="/implementations/">Implementations</a>
<a class="btn" href="https://github.com/NeboLoop/nebo-link">Reference implementation</a>
</div>

## What it is

The [Agent Client Protocol](https://agentclientprotocol.com) (ACP) lets an editor drive a coding agent running on the same machine. Open Agent Link carries ACP unchanged over an authenticated WebSocket and adds what it takes once the client is somewhere else.

- **A host lists its agents.** One computer can run several agents, each with its own folder and sign-in.
- **Pairing by one-time code.** Each device gets its own key and can be removed on its own.
- **No open ports.** Hosts dial out to a relay, or clients reach them on the local network.
- **Resumable turns.** A client that reconnects mid-turn gets the running turn and any waiting permission question.
- **Permission questions reach every device.** The first answer wins.
- **Per-turn usage, plain errors and version ranges.**

Any ACP agent works, including Claude Code, Codex, Gemini CLI and OpenCode.

## Conformance

Compatible means passing the conformance suite. It can test a host, or act as a host to test a client.

```
oal-conformance host wss://<relay>/oal/hosts/<host> --code ABCD-1234 --agent <id>
oal-conformance client --listen 127.0.0.1:7878 --code K7QM-3XRD
```

## Resources

- [Specification 0.1](/spec/0.1/)
- [JSON Schemas](https://github.com/NeboLoop/nebo-link/tree/main/spec/schemas), served at `https://openagent.link/schemas/0.1/`
- [Annotated examples](https://github.com/NeboLoop/nebo-link/tree/main/spec/examples)
- [Proposing a change](https://github.com/NeboLoop/nebo-link/tree/main/spec/rfcs)
- [List your implementation](/submit/)

## Status

0.1 is a draft. End-to-end encryption between client and host is specified and arrives in 0.2. It is required for 1.0.
