# Contributing to SIGS

If you would like to contribute to the project, it may be a good idea to start with the [README](https://github.com/GCES-2018-2/SIGS-GCES/blob/master/README.md) to know more about us.
Another important document that should be read is the [Code of Conduct]().

Thanks for contributing! :tada::+1: Your help will be received with great gratitude!

# How can I contribute?

## Reporting a Bug

* This project follows a [_Issue_](https://github.com/GCES-2018-2/SIGS-GCES/blob/master/.github/ISSUE_TEMPLATE.md) pattern. So if you find a bug, make sure it is not in one of our [_Issues_](https://github.com/GCES-2018-2/SIGS-GCES/issues). Bugs should be marked with _label (tag)_ __bug__.

* If the bug found is not in the _Issues_, just open a [_New Issue_](https://github.com/GCES-2018-2/SIGS-GCES/issues/new).

## Adding and/or modifying some functionality

* First, check that there is no [_Issue_](https://github.com/GCES-2018-2/SIGS-GCES/issues) regarding this modification and/or addition.

* If it does not exist, create a [_New Issue_](https://github.com/GCES-2018-2/SIGS-GCES/issues/new). Give a meaningful title to it, put a description and at least a _label_.

* Changes must be submitted through [_Pull Requests_](https://github.com/GCES-2018-2/SIGS-GCES/compare). You can find more about this in the [_Pull Requests Template_](https://github.com/GCES-2018-2/SIGS-GCES/blob/master/.github/PULL_REQUEST_TEMPLATE.md).

# Commits Pattern

## For standardization we recommend the community to follow our _commit_ style:

* _Commits_ must all be in __English__;

* It should contain a short and objective title of what was done in that _commit_;

* After this title, the commit should describe, with a little more detail, all the activities performed;

* If you are working with an associate, sign on your _commits_ with your partners.

__Example:__

    Creating project community files (Shot and objective title)

    Adds project license (Description of one of the activities)

    Adds project code of conduct file

    Adds project contributing file

    Adds project issue template file

    Adds projects pull request file

    Co-authored-by: John Doe <johndoe@mail.com> (Partnership signarute)

# Branch Policy

With the goal of maintaining the completeness and reliability of the project code, the use of branch policy was proposed. This Branches Policy should guide developers in organizing their contributions to the repository.

__Note__: The _branchs_ policy was designed to work in conjunction with the _git flow_ tool, its documentation and more information can be accessed [here](https://github.com/nvie/gitflow).

* __`master`__ - Main branch of the repository where only consolidated and tested software integration will be allowed. This branch will be exclusively for the delivery of realeases, that is, a greater set of functionalities that integrate the software. Here will be the _**stable**_ version of the software.

* __`develop`__ - Branch for the integration of new functionalities, where it will be allowed to deliver the features developed and that are in an advanced stage of completeness. It will be the base branch for the beginning of the development of the features and of the correction of bugs. The releases will also be merged here.

* __`feature/<feature-name>`__ - Branch used for the development of new features. If the feature has been proposed by a _issue_ of the repository and accepted, the name should contain the _issue_ number.
e.g.: `feature/1-<new-feature-name>` (whereas feature has been requested in _issue_ #1)

* __`bugfix/<bug-name>`__ - Branch used to fix low/medium urgency bugs that are not present in the __master__ branch. If the bug has been reported by a _issue_ from the repository the name should contain the _issue_ number.
e.g.: `bugfix/1-<bugfix-name>` (whereas feature has been requested in _issue_ #1)

* __`hotfix/<bug-name>`__ - Branch used to fix high-urgency bugs that are present in the __master__ branch. If the bug has been reported by a _issue_ from the repository the name should contain the _issue_ number.
e.g.: `hotfix/1-<hotfix-name>` (whereas feature has been requested in _issue_ #1)

* __`release/<release-version>`__ - Branch where final adjustments/build will be made prior to delivery of a software product release. Branch name will be the version of the release to be delivered.

* __`support/<theme-or-kind>`__ - Branch where support tasks related to the software will be performed, such as documentation development, configuration management corrections, and so on.

* __`improvement/<improvement-name>`__ - Branch used for the improvement of functionalities or documentation project . If the improvement has been proposed by a _issue_ of the repository, the name should contain the _issue_ number.
e.g.: `improvement/1-<improvement-name>` (whereas feature has been requested in _issue_ #1)
