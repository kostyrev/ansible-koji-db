koji-db
=========

[![Build Status](https://travis-ci.org/kostyrevaa/ansible-koji-db.svg?branch=master)](https://travis-ci.org/kostyrevaa/ansible-koji-db)

This role configures the database for koji.

This is one of the koji- roles which configures the whole koji stack.

Roles are:

 * [koji-ca](https://galaxy.ansible.com/kostyrevaa/koji-ca)
 * [koji-db](https://galaxy.ansible.com/kostyrevaa/koji-db)
 * [koji-client](https://galaxy.ansible.com/kostyrevaa/koji-client)
 * [koji-hub](https://galaxy.ansible.com/kostyrevaa/koji-hub)
 * [koji-web](https://galaxy.ansible.com/kostyrevaa/koji-web)
 * [koji-kojira](https://galaxy.ansible.com/kostyrevaa/koji-kojira)
 * [koji-builder](https://galaxy.ansible.com/kostyrevaa/koji-builder)

For example of all-in-one setup go to https://github.com/kostyrevaa/ansible-koji-infra

Requirements
------------

This role doesn't not provision PostgreSQL setup nor does it create postgresql users for you.

You should use some other role for that. I use patrik.uytterhoeven.PostgreSQL-For-RHEL6x

Role Variables
--------------

There are some variables in the default/main.yml which can (or needs to) be changed/overriden:

* `koji_dbname`: DB name for koji setup. Default is koji.

* `koji_db_user`: DB's user that owns koji schema. Default is koji.


Dependencies
------------

* [patrik.uytterhoeven.PostgreSQL-For-RHEL6x](https://galaxy.ansible.com/patrik.uytterhoeven/PostgreSQL-For-RHEL6x)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: koji_db
      roles:
         - role: patrik.uytterhoeven.PostgreSQL-For-RHEL6x
           postgresql_databases:
             - name: koji
           postgresql_users:
             - name: koji
                 pass: "{{ koji_db_pass }}"
                 encrypted: no       # denotes if the password is already encrypted.
           postgresql_user_privileges:
             - name: koji         # user name
               db: koji           # database
               priv: "ALL"        # privilege string format: example: INSERT,UPDATE/table:SELECT/anothertable:ALL

         - role: kostyrevaa.koji-db
  

License
-------

MIT / BSD

Author Information
------------------

Send your suggestions and pull requests to https://github.com/kostyrevaa/ansible-koji-db.  
When send PR make sure your changes are backward-compatible.  
You may test your changes to role with https://github.com/kostyrevaa/ansible-koji-infra
