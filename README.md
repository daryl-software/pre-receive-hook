# pre-receive-hook

gitlab pre-receive hook.

Should also run on GitHub enterprise.

Basically it disable push force.

## Installation

Installation scripts are provided in `install_scripts/` folder.

First you must clone this repository somewhere.

On GitLab you have to add custom hooks on any repositories, the script will install hooks on every repositories so you'll have to remove pre-receive hook on repositories where you want to disable it. Also you'll have to run this script every time a new repository is created in GitLab.

Run `./install_scripts/gitlab.sh /path/to/gitlab/data`

