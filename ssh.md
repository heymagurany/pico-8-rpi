# Public-Key Authentication with SSH

    ssh-keygen -t rsa -b 4096 -C "your.email@example.com"
    vim ~/.ssh/config

    Host example.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/whatever_rsa

    ssh-add -K ~/.ssh/whatever_rsa
    ssh-copy-id -i ~/.ssh/whatever_rsa.pub user@example.com

