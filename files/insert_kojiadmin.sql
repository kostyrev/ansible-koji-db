insert into users (name, usertype, status) values ('kojiadmin', 0, 0);
insert into user_perms (user_id, perm_id, creator_id)
      select users.id, permissions.id, users.id from users, permissions
      where users.name in ('kojiadmin')
            and permissions.name = 'admin';
