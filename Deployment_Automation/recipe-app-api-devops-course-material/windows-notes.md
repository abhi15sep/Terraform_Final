# Windows Notes

This document contains tips, tricks and general notes for following the course on Windows.


## SSH Agent

It's useful to be able to add your key to an SSH agent on Windows Git Bash. 

However, when running `ssh-add` you might see the following error:

```text
Could not open a connection to your authentication agent.
```

To fix this, start the SSH agent by running:

```bash
eval `ssh-agent -s`
```

## Error: Could not fork child process: There are no available terminals (-1)

If you see the above error, try killing the `ssh-agent.exe` application and re-opening Git Bash.

See [Auto-launching `ssh-agent` on Git for Windows](https://help.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows) for a fix.