# Git Configuration

After the initial setup script few things to do:

1. Generating an SSH key
1. Associate the SSH key with the remote repository
1. Set your remote URL to a form that supports SSH

## Generating an SSH key

Simply running the command

```
ssh-keygen -t rsa # for rsa encrypted keypair or
ssh-keygen -t ed25519 # for ed25519 encrypted keypair
```

The above commnad should create a `.ssh` directory in your home directory
with usually two files, one being a `.pub` file and another a file named
after the keypair type chosen.
Add this generated keypair to `Github` for a secure push to remote which
is the file ending with the `.pub` extension.

## Authentication

After adding the SSH key to `Github` now to authenticate the ssh key with `Github`
we run the command:

```
ssh -T git@github.com
```

Now just cloning the repository from `Github` or any other platform or making
a new remote repository and setting its remote url to the local git clone repo.
This sets the remote url to this local repository.

```
git remote set-url origin git@github.com:<url-repo>.git
```

### Annoying password prompt with every push?

To resolve this either the credentials can be saved permanently or it could
be cached with a timeout.

1. To permanently save credentials in unencrypted way is by using:

```
git config credential.helper store
or
git config --global credential.helper store
```

1. To store cached credentials

```
git config credential.helper cache
or
git config --global credential.helper cache # for global settings
```

1. To store cached credentials with a timeout

```
git config credential.helper 'cache --timeout=86400' # for 24 hrs
OR
git config --global credential.helper 'cache --timeout=86400'
```

The timeout time takes values in `seconds` which is `n hours = n hours x 60 minutes x 60 secs = n seconds`.
