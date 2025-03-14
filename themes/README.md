# Theme Management

## Dario Theme

The "dario" theme is managed as a Git submodule. This means:

1. The theme's source code is stored in an external repository: https://github.com/GrantBirki/dario.git
2. The theme is pinned to a specific commit (aac9ca215d6840a6731d7eb0ea0c1bb5cba44a81) for stability and security
3. The `.git` file in the dario theme directory is a reference file that points to the actual Git repository data stored in the parent repository's `.git/modules` directory

### Updating the Theme

To update the theme to a newer version:

```bash
cd dario
git fetch origin
git log --oneline origin/main  # View available commits
git checkout [new-commit-hash]  # Choose a specific commit
cd ../..
git add themes/dario
git commit -m "Update dario theme to newer commit"
```

### Important Notes

- Do not delete the `.git` file in the theme directory as it's required for the submodule to function properly
- Always use Git submodule commands to manage the theme (not direct Git commands within the theme directory)
- When cloning this repository, use `git clone --recursive` to automatically initialize and update the submodule 