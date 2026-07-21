# Fast-Drone-250 Agent Guidelines Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create and publish repository-level Codex instructions for safe, evidence-based Fast-Drone-250 source optimization.

**Architecture:** Keep durable workflow rules in the root `AGENTS.md` and link the three user-provided architecture documents as non-authoritative references. Configure only this repository's Git identity, preserve the official project as `upstream`, and publish the documentation through the user's fork as `origin`.

**Tech Stack:** Markdown, Git, ROS1/Catkin repository conventions

---

### Task 1: Configure repository-local Git metadata

**Files:**
- Modify: `.git/config`

- [ ] **Step 1: Configure the repository-local identity**

Run:

```bash
git config user.name Yee130513
git config user.email 2762496724@qq.com
```

Expected: both values are stored only in this repository.

- [ ] **Step 2: Preserve the official remote and configure the user's repository**

Run:

```bash
git remote rename origin upstream
git remote add origin https://github.com/Yee130513/Fast-Drone-250-original.git
git remote -v
```

Expected: `origin` points to `Yee130513/Fast-Drone-250-original.git`; `upstream` points to `ZJU-FAST-Lab/Fast-Drone-250.git`.

### Task 2: Create repository instructions

**Files:**
- Create: `AGENTS.md`
- Reference: `1_workspace_structure.md`
- Reference: `2_topics_packages.md`
- Reference: `3_planner_framework.md`

- [ ] **Step 1: Write `AGENTS.md`**

Create a concise Chinese repository guide containing these enforceable sections:

```text
项目目标与部署流程
指令适用范围
参考资料与证据优先级
修改前检查
稳定性优先原则
关键链路检查
实现要求
分级验证
Git 与工作区规则
任务完成报告
```

The guide must state that the three reference documents may be inaccurate or outdated, and that current source, headers, launch/YAML, build manifests, logs, and reproducible test evidence take precedence.

- [ ] **Step 2: Validate document structure and content**

Run:

```bash
test -s AGENTS.md
grep -F '1_workspace_structure.md' AGENTS.md
grep -F '2_topics_packages.md' AGENTS.md
grep -F '3_planner_framework.md' AGENTS.md
grep -F '仅供参考' AGENTS.md
```

Expected: every command exits with status 0.

### Task 3: Review and publish documentation

**Files:**
- Create: `AGENTS.md`
- Create: `docs/superpowers/specs/2026-07-21-agent-guidelines-design.md`
- Create: `docs/superpowers/plans/2026-07-21-agent-guidelines.md`

- [ ] **Step 1: Check formatting and staged scope**

Run:

```bash
git diff --check
git status --short
git diff -- AGENTS.md docs/superpowers/specs/2026-07-21-agent-guidelines-design.md docs/superpowers/plans/2026-07-21-agent-guidelines.md
```

Expected: no whitespace errors; unrelated user files remain unchanged and unstaged.

- [ ] **Step 2: Commit only the three documentation files**

Run:

```bash
git add AGENTS.md docs/superpowers/specs/2026-07-21-agent-guidelines-design.md docs/superpowers/plans/2026-07-21-agent-guidelines.md
git diff --cached --check
git commit -m "docs: add repository agent guidelines"
```

Expected: one commit containing only the three listed files.

- [ ] **Step 3: Push the current branch to the user's repository**

Run:

```bash
git push -u origin master
```

Expected: the local `master` branch tracks `origin/master`.
