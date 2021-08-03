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

.. code-block:: yaml

    name: 'Named Branches'
    on: push
    jobs:
    named-branches:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        with:
            fetch-depth: 0
        - uses: Julian/named-branch-action@main
        with:
            github_token: '${{ secrets.GITHUB_TOKEN }}'

See `action.yml <action.yml>`_ for full details, or `this repository
<https://github.com/Julian/named-branch-action-example/`_ for a fully worked
example.

Then, in any local clone where you wish to see branch information,
ensure you're fetching git notes from the remote via e.g.::

    $ git config --add remote.origin.fetch "+refs/notes/*:refs/notes/*"

at which point you can check where a commit came from via::

    $ git notes --ref branch show 710ca11

which will show ``refs/heads/foo`` if ``710ca11`` was committed on the
``foo`` branch.

Notes
-----

The remote repository only knows about remote branches, so if you
created some commits on a local branch and then merged it into another
local branch without pushing, you won't see two branches in the notes.
