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
* node['unsafe_umask']['umask']['unsafe'] Vulnerable value of umask in login.defs file, defaults to 022
* node['unsafe_umask']['umask']['safe'] Secure value of umask in login.defs file, defaults to 022
* node['unsafe_umask']['usergroups']['unsafe'] Vulnerable value for USERGROUPS_ENAB in login.defs file, defaults to yes
* node['unsafe_umask']['usergroups']['safe'] Secure value of USERGROUPS_ENAB in login.defs file, defaults to no

## Templates
### logindefs.erb
The template logindefs.erb is used by the umask (vulnerability) recipes and 
replaces /etc/login.defs after the substitutions are made.

#### Variables
* umask The value for the umask setting
* usergroups The value for the USERGROUPS_ENAB setting

## Usage
### unsafe_umask::default
Includes the `unsafe_umask::up` recipe.

### unsafe_umask::up
Perform 'unsafe' substitutions on logindefs.erb and replaces /etc/login.defs</td>

### unsafe_umask::down
Perform 'safe' substitutions on logindefs.erb and replaces /etc/login.defs</td>

License and Authors
-------------------
Authors: William Sharar, Erran Carey

License: Copyright 2013, Rapid7. All rights reserved - Do Not Redistribute.
