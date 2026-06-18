# 🩺 Terraform Triage: Debug a Broken CI/CD Pipeline

## 🛑 Prerequisites

Before beginning this workshop, please ensure your environment is correctly set up by following the instructions in our prerequisites documentation:

➡️ **[Prerequisites guide](https://github.com/daemon-labs-io/prerequisites)**

### Workshop setup

#### Open a terminal window

- **macOS:** open Spotlight (Cmd+Space), type "Terminal", press Enter.
- **Windows:** press the Windows key, type "Windows Terminal" (or "PowerShell"), press Enter. If you're using WSL, open your WSL distribution instead so paths and permissions behave as expected.
- **Linux:** Ctrl+Alt+T on most desktops, or open your distribution's terminal emulator of choice.

#### Navigate to your repositories folder

We recommend creating a `daemon-labs` folder in your home directory so everyone in the room is working from the same place:

- **macOS / Linux / WSL**

  ```shell
  mkdir -p ~/daemon-labs && cd ~/daemon-labs
  ```

- **Windows PowerShell**

  ```shell
  mkdir $HOME\daemon-labs -Force; cd $HOME\daemon-labs
  ```

> [!TIP]
> Prefer to keep your own convention? `cd` into whichever folder you normally use for repositories — the rest of the workshop works the same either way.

#### Clone this repository

```shell
git clone https://github.com/daemon-labs-io/terraform-triage.git
```

#### Open the folder in your code editor

```shell
code ./terraform-triage
```

> [!WARNING]
> If this command doesn't work, open Visual Studio Code → open the Command Palette (Cmd+Shift+P on macOS, Ctrl+Shift+P on Windows/Linux) → type "Install 'code' command in PATH" → press Enter.

<!--  -->

> [!TIP]
> With Visual Studio Code open, you can do everything else from within the editor.  
> Open the terminal pane via Terminal → New Terminal.

#### Configure your AWS credentials

The facilitator will post short-lived AWS credentials in the workshop Slack channel. From the repository root, copy the credentials template:

- **macOS / Linux / WSL**

  ```shell
  cp .env.example .env
  ```

- **Windows PowerShell**

  ```shell
  Copy-Item .env.example .env
  ```

Open `.env` in your editor and fill in two things:

1. **`AWS_*` values** — paste the three credentials the facilitator has posted in the workshop Slack channel.
2. **`PARTICIPANT_ID`** — set this to your GitHub username (lowercase) so your resources and Terraform state don't clash with anyone else's.

> [!NOTE]
> Sessions are short-lived (typically 1 hour). If you start seeing `ExpiredToken` errors during the workshop, ask the facilitator for a refresh in Slack and re-save `.env`.

### Workshop-specific prerequisites

Choose the path that matches how you're taking the workshop:

- **At an in-person workshop?** Follow the [in-person workshop prerequisites](./prerequisites/WORKSHOP.md).
- **Working through this on your own (at home or at work)?** Follow the [individual prerequisites](./prerequisites/INDIVIDUAL.md).

---

## Running locally

Both `terraform` and the AWS CLI are available via Docker Compose — no local install required. From the repository root:

```shell
docker compose run --rm terraform <command>
docker compose run --rm aws-cli <command>
```

---

## The scenario

An application team you have never met spent last quarter standing up a Terraform pipeline on GitHub Actions, wired into AWS via OIDC. It deploys a single, modest web server in their London region — nothing exotic. They demoed it once, declared victory, and rolled off. The handover note is two paragraphs long. The pipeline is not working. Nobody can tell you exactly when it stopped, or whether it ever really started.

You have ninety minutes to make it work again, followed by twenty minutes where every pair shares what they found. There is no walkthrough and no obvious starting point — just the repository in front of you and the evidence the pipeline produces when you push it.

---

## Definition of done

A pull request runs the workflow green end-to-end, **and** `curl` against the deployed EC2 instance returns HTTP 200. Both conditions, on the same run. One without the other does not count.

---

## Where the evidence lives

Three surfaces tell the story between them. A good diagnosis triangulates across all three rather than camping out in one.

- **Terraform plan and apply output** — what the configuration intends to do, and what it actually does when it meets the cloud.
- **GitHub Actions logs** — what ran, in what order, with what identity, and where it gave up.
- **AWS error messages** — surfaced through Terraform, the Actions log, or the AWS console. Read the exact verb, principal, and resource carefully.

Some of what you see will be a real problem; some will be a distraction. Whether you are looking at one issue or several is for you to determine.

> [!TIP]
> When one surface contradicts another, the contradiction is itself a clue. Read the evidence; do not pattern-match against pipelines you have debugged before.

---

## Ways of working

- **Pairs or trios.** Diagnostic reasoning out loud, with someone to disagree with you, is the point of the room. Solo runs are discouraged.
- **PR-driven.** Open a branch, open a pull request, push your fix attempts. Every push gives the whole table another CI log to read and argue about. Local verification with `docker compose run --rm terraform plan` is useful, but the workflow on a PR is what the room is debugging together.
- **AI is welcome.** Copilot, Claude, ChatGPT — bring whatever you normally use. This is not a Terraform syntax exam; it is a diagnostic reasoning exercise across three noisy surfaces, and the tools you would use at work are the tools to use here.

> [!NOTE]
> At the ninety-minute mark we stop, regardless of state. The final twenty minutes are a share-out: what you found, what misled you, and what you would change about the pipeline if it were yours to own.
