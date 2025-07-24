# _Git Branching Strategy_

Git branching allows you to create separate lines of development within a repository, enabling you to work on features, fixes, or experiments independently without affecting the main codebase.

## 1.What is a Branch?

- A branch in Git is a pointer to a specific commit in the repository's history.

- It represents an independent line of development, allowing you to work on features, bug fixes, or experiments without affecting the main codebase (usually the main or master branch).

## 2.Key Concepts

### Main Branch

- The default branch in a repository, typically named main or remote.
- Represents the productive-ready or stable version of the code.

### Feature Branch

- A branch created to develop a new feature.
- Example: feature/login-page

### Bugfix Branch

- A branch created to fix a bug.
- Example: bugfix/issue-123.

### Release Branch

- A branch created to prepare for a new release.
- Example: release/v1.0

### Hotfix Branch

- A branch created to quickly fix critical issues in production.
- Example: hotfix/critical-bug.

## 3.Basic Branching Commands

### Create a new Branch

```bash
git branch <branch-name>
```

### Switch to new Branch

```bash
git checkout <branch-name>
```

### Create and switch to a new Branch

```bash
git checkout -b <branch-name>
```

### List All Branches

```bash
git branch
```

### Delete a Branch

```bash
git branch -d <branch-name>
```

### Rename a Branch

```bash
git branch -m <old-name> <new-name>
```

## 4.Merging Branches

- Merging combines the changes from one branch into another.

### Merge a Branch into the Current Branch

```bash
git merge <branch-name>
```

### Merge Strategies

- _Fast-Forward Merge_: Moves the branch pointer forward if there are no conflicting changes.
- _Recursive Merge_: Combines the changes and creates a new merge commit if there are conflicts.

### Resolve Merge Conflicts

- Git will notify you of conflicts during merge.
- Open the conflicting files, resolve the conflicts, and stage the changes:

```bash
git add <file-name>
```

- Complete the merge:

```bash
git commit
```

## 6.Rebasing

- Rebasing rewrites the commit history by applying changes from one branch onto another

### Rebase the branch

```bash
git  rebase <branch-name>
```

### Interactive Rebasing

```bash
git rebase -i <commit-hash>
```

## 7.Remote Branches

- Remote branches are branches on a remote repository (eg. GitHub).

### Push a remote branch

```bash
git push origin <branch-name>
```

### Track a Remote Branch

```bash
git checkout --track origin/<branch-name>
```

### Delete a Remote Branch

```bash
git push origin --delete <branch-name>
```

## 8.Branching Workflows

### Feature Branch Workflow

1. Create a new branch for each feature:

```bash
git checkout -b feature/new-feature
```

2. Commit changes to the feature branch.
3. Merge the feature branch into main when Complete:

```bash
git checkout main
git merge feature/new-feature
```

## GitHub Workflow

- Use specific branches for features, releases and hotfixes.
- Example:

* **main** : production-ready code.
* **develop** : Integration branch for features.
* \*feature/\*\*: Feature branches.
* \*release/\*\*: Releases preparation branches.
* \*hotfix/\*\*: Critical bug fixes.

## Forking Workflow

- Each developer forks the main repository and worked on their on their own copy.
- Changes are merges via pull Requests.

## 9.Best Practices

- **keep Branches small**: work on one feature or bug fix per branch.
- **Name Branches Clearly**: Use descriptive names like feature/login-page or bugfix/issue-123.
- **Merge Frequently**: Regularly merge changes from main into you branch to avoid large conflicts.
- **Deleted Merged Branches**: clean up branches that are no longer needed.
- **Use Pull Requests**: Review and discuss changes before merging.
