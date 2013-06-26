# Unsafe Umask
This cookbook contains recipes that, when applied, make an Ubuntu node
vulnerable. In this case, the vulnerability is an unsafe UNIX umask, which should 
only be detected with an authenticated scan.

## Requirements
### Platform
* Ubuntu
  * Tested on 12.04
* Should work on: Debian

## Attributes
### unsafe_umask::default
* `node[:unsafe_umask][:safe]` Whether to secure the node's umask,
  defaults to true
* `node[:unsafe_umask][:umask]` Value of umask in `login.defs` file,
  defaults to 077
* `node[:unsafe_umask][:user_groups']` Value for USERGROUPS_ENAB in
  `login.defs` file, defaults to no

## Templates
### logindefs.erb
The template logindefs.erb is used by the umask (vulnerability) recipes and 
replaces `/etc/login.defs` after the substitutions are made.

#### Variables
* `umask` The value for the umask setting
* `user_groups` The value for the USERGROUPS_ENAB setting

## Usage
### unsafe_umask::default
Perform safe or unsafe substitutions on logindefs.erb and replaces
`/etc/login.defs` with the rendered
[template](templates/default/logindefs.erb).

License and Authors
-------------------
Authors: William Sharar, Erran Carey

License: Copyright 2013, Rapid7. All rights reserved - Do Not Redistribute.
