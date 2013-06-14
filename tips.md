* Opening files via tramp/sudo

When you have your user set in your ssh_config, you can usually do this:
```
C-x C-f /sudo:raspy.local:/etc/fstab RET
```

Sometimes tramp gets pissy about that, here is a more explicit
version:

```
C-c C-f /ssh:user@host|sudo:root@host:/etc/fstab
```

If you have your user set in your ssh_config, you can omit "user@" in
the above example
