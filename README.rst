==============
Named Branches
==============

An implementation of `hg-style named
branches <https://www.mercurial-scm.org/wiki/NamedBranches>`_ implemented via
`GitHub Actions <https://github.com/features/actions>`_ plus `git notes
<https://git-scm.com/docs/git-notes>`_.

Usage
-----

For the repository in question, in e.g.
``.github/workflows/named-branches.yml``:

```yaml
name: 'Named Branches'
on: push
jobs:
  named-branches:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - uses: Julian/named-branch-action@main
      with:
        github_token: '${{ secrets.GITHUB_TOKEN }}'
```

(See `action.yml <action.yml>`_ for full details).

Then, in any local clone where you wish to see branch information,
ensure you're fetching git notes from the remote via e.g.::

    $ git config --add remote.origin.fetch "+refs/notes/*:refs/notes/*"
