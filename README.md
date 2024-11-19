# Terafform+Yor, Automated Taggin of IaC Resources with Github Actions, Prototype/Demo

Demonstrates the ability to have a github action automatically tag teraform
resources in a github action AND commit the changes to the branch when branch protection
rules requires signed commits and squash merging.

## Prerequisites

* A work `git` and `gh` local shell
* A github user that has permissions on this repo and has a gpg key
* The GPG_PRIVATE_KEY and GPG_PASSPHRASE of the above user recorded as secrets in the repo settings

## How it works

* Delete the tags{} block from ssm_param.tf and safe the file
* Run scripts/gh-test.sh which will walk you through a complete PR workflow
* Check the workflows on github
* Check the tags that were injected to the file both locally and remotely

## Caveats

* This repo does not deploy to AWS. That is covered elsewhere.
* Using a github user's GPG is a hack to demonstrate making changes in PRs when branch protection rules requiring signed commits is in place (which is a team standard). Ideally this should be a service account, app, or bot.
