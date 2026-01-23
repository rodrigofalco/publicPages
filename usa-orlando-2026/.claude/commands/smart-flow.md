---
name: smart-flow
description: Intelligently analyze a task and select the optimal swarm configuration using claude-flow
---

# Smart Flow - Intelligent Swarm Selector

You are an intelligent swarm orchestrator. Analyze the given task and select the optimal swarm configuration.

## Task to Analyze
```
$ARGUMENTS
```

## Instructions

Execute the following steps to analyze the task and configure the optimal swarm:

### Step 1: Route Analysis
Use the `mcp__claude-flow__hooks_route` tool to analyze the task and get agent recommendations:
- Pass the task description to get primary and alternative agent suggestions
- Note the confidence scores and complexity estimation

### Step 2: Model Routing
Use the `mcp__claude-flow__hooks_model-route` tool to determine the optimal Claude model:
- haiku: Fast, simple tasks
- sonnet: Balanced complexity
- opus: Complex, critical tasks

### Step 3: Topology Selection
Based on the task analysis, select the optimal topology using `mcp__claude-flow__coordination_topology`:

| Task Type | Recommended Topology | When to Use |
|-----------|---------------------|-------------|
| **mesh** | Peer-to-peer collaboration | Research, brainstorming, multi-perspective analysis |
| **hierarchical** | Tree structure with coordinator | Development, complex implementations, code review |
| **star** | Central coordinator | Simple tasks, single-focus work |
| **ring** | Sequential processing | Pipeline tasks, data transformation |
| **hybrid** | Mixed approach | Complex multi-phase projects |
| **hierarchical-mesh** | Best of both | Large enterprise tasks |

### Step 4: Agent Configuration
Based on the route analysis, spawn the recommended agents using `mcp__claude-flow__agent_spawn`:

**Common Agent Patterns:**
- **Development**: coordinator + developer + reviewer + tester
- **Research**: coordinator + researcher + analyzer + documenter
- **Testing**: coordinator + tester + reviewer + analyzer
- **Optimization**: coordinator + analyzer + developer + tester
- **Documentation**: coordinator + documenter + researcher + reviewer

### Step 5: Swarm Initialization
Initialize the swarm with optimal configuration using `mcp__claude-flow__swarm_init`:
- Set the selected topology
- Configure max agents based on complexity
- Apply any special configuration

### Step 6: Task Creation
Create the task using `mcp__claude-flow__task_create` with:
- Appropriate type (feature, bugfix, research, refactor)
- Priority based on urgency indicators in the task
- Tags for categorization

## Decision Matrix

Use this matrix to guide your decisions:

| Complexity | Agents | Topology | Model | Max Duration |
|------------|--------|----------|-------|--------------|
| Low | 2-3 | star | haiku | 15 min |
| Medium | 3-5 | hierarchical | sonnet | 30 min |
| High | 5-8 | mesh | sonnet | 60 min |
| Critical | 8-12 | hierarchical-mesh | opus | 120+ min |

## Output Format

After analysis, provide a summary:

```
## Swarm Configuration Summary

**Task:** [brief description]
**Complexity:** [low/medium/high/critical]
**Recommended Model:** [haiku/sonnet/opus]
**Topology:** [selected topology]
**Primary Agent:** [agent type] (confidence: X%)
**Supporting Agents:** [list of agents]
**Estimated Duration:** [time range]

### Swarm Initialized
- Swarm ID: [id]
- Agents Spawned: [count]
- Task ID: [id]

### Next Steps
[What the swarm will do]
```

## Execute Now

Analyze the task "$ARGUMENTS" and configure the optimal swarm. If no task is provided, ask the user what task they want to accomplish.
