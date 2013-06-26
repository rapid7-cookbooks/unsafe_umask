Unsafe Umask Cookbook
==================
This cookbook contains recipes that, when applied, make an Ubuntu node
vulnerable. In this case, the vulnerability is an unsafe UNIX umask, which should 
only be detected with an authenticated scan.

Requirements
------------
### Platform
* Ubuntu
  * Tested on 12.04
* Should work on: Debian

Attributes
----------
#### unsafe_umask::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['unsafe_umask']['umask']['unsafe']</tt></td>
    <td>String</td>
    <td>Vulnerable value of umask in login.defs file</td>
    <td><tt>022</tt></td>
  </tr>
  <tr>
    <td><tt>['unsafe_umask']['umask']['safe']</tt></td>
    <td>String</td>
    <td>Secure value of umask in login.defs file</td>
    <td><tt>022</tt></td>
  </tr>
  <tr>
    <td><tt>['unsafe_umask']['usergroups']['unsafe']</tt></td>
    <td>String</td>
    <td>Vulnerable value for USERGROUPS_ENAB in login.defs file</td>
    <td><tt>yes</tt></td>
  </tr>
  <tr>
    <td><tt>['unsafe_umask']['usergroups']['safe']</tt></td>
    <td>String</td>
    <td>Secure value of USERGROUPS_ENAB in login.defs file</td>
    <td><tt>no</tt></td>
  </tr>
</table>

lsTemplates
----------
#### unsafe_umask::default
The template logindefs.erb is used by the umask (vulnerability) recipes and 
replaces /etc/login.defs after the substitutions are made.
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>umask</tt></td>
    <td>String</td>
    <td>The value for the umask setting</td>
  </tr>
  <tr>
    <td><tt>usergroups</tt></td>
    <td>String</td>
    <td>The value for the USERGROUPS_ENAB setting</td>
  </tr>
</table>


Usage
-----
#### unsafe_umask::default
<table>
  <tr>
    <th>Recipe</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>default</td>
    <td>Includes a call to 'up'</td>
  </tr>
  <tr>
    <td>up</td>
    <td>Perform 'unsafe' substitutions on logindefs.erb and replaces /etc/login.defs</td>
  </tr>
  <tr>
    <td>down</td>
    <td>Perform 'safe' substitutions on logindefs.erb and replaces /etc/login.defs</td>
  </tr>
</table>

License and Authors
-------------------
Authors: William Sharar
License: Copyright 2013, Rapid7. All rights reserved - Do Not Redistribute.
