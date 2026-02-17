Day 17 Notes (Short)
Goal: Managing Access Control on Linux Servers.

1. chown (Change Ownership)

Used to change the User and Group that owns a file/directory.

Syntax: sudo chown user:group filename

Example: sudo chown -R ubuntu:ubuntu /var/www/html

2. chmod (Change Mode)

Used to change the Read (4), Write (2), and Execute (1) permissions.

Syntax: chmod <numbers> filename

Common Settings:

644: Good for files (Owner can read/write, everyone else can only read).

755: Good for directories/scripts (Owner can do everything, others can read/execute).

777: NEVER USE THIS (Full access to everyone).