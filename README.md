# actions
Contains public shared GitHub Actions actions for convenience use in GitHub Actions workflows. Needs to be public to be able to reference them in the workflows.

## Updating/publishing
1. Commit and push your updates
2. If there are breaking changes create a new tag
3. If there are only minor changes (like updating other actions) force update the latest tag
    1. git tag -f v11
    2. git push -f origin v11