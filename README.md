# pre-receive-hook

gitlab|gitolite pre-receive hook.

Should also run on GitHub enterprise.

Basically it runs a linter on some files. Supported:
- crontab via chkcrontab
- PHP files: syntax + PHP CS PSR2

## Installation

Installation scripts are provided in install_scripts/ folder.

First you must clone this repository somewhere. Some minor dependencies must be present on system that will run pre-receive hook (for instance, a GitLab docker image.)

- coreutils


### Add it to an existing pre-receive hook

Simply call it, append it to your existing pre-receive hook:
```

```

### gitolite

Run `./install_scripts/gitolite.sh /path/to/git_home_directory`

Example:
```
./install_scripts/gitolite.sh ~git/
```

### GitLab

On GitLab you have to add custom hooks on any repositories, the script will install hooks on every repositories so you'll have to remove pre-receive hook on repositories where you want to disable it. Also you'll have to run this script every time a new repository is created in GitLab.

Run `./install_scripts/gitlab.sh /path/to/gitlab/data`

