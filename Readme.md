# Command [Concourse](http://concourse.ci) Resource

This is POC resource for [Concourse](http://concourse.ci) to execute arbitrary
commands

## Source Configuration

Only one parameter is required, the (path) command:

* `command`: The command to be executed within the container


## Behavior

### `check`, `in`

Currently this resource only supports the `put` phase of a job plan, so these
are effectively no-ops. This will likely change in the future.

### `out`: Run an command

Run a command with the given arguments.

#### Parameters

Only one optional parameter can be specified:

* `args`: A string containing the arguments for the given command


## Example Pipeline

```yml
---
resource_types:
- name: command
  type: docker-image
  source:
    repository: platformengineering/concourse-command-resource

resources:
- name: source
  type: git
  source:
    uri: git@github.com:springerpe/repository.git
    branch: master
    private_key: {{github-private-key}}
- name: run_ls
  type: command
  source:
    command: ls

jobs:
- name: run-command
  plan:
  - get: source
  - put: run_ls
    params:
      args: "-la"
```

# Author

Jose Riguera <jose.riguera@springernature.com>

(c) 2017 Springer Nature Platform Engineering

