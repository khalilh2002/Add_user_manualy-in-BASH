# Add User Manually in Bash 🐚

This is a simple Bash script that demonstrates how to manually add a user to a Linux system without using the `useradd` command. It’s designed for **learning purposes** and showcases how user data is handled in Linux. 🛠️

## Features ✨
- Manually adds a user by:
  - Creating entries in `/etc/passwd` and `/etc/group`.
  - Setting up a home directory.
  - Assigning a default shell (`/bin/bash`).
- No reliance on `useradd` or similar commands, giving you insight into the user creation process. 🧑‍💻

## How It Works 🤔
1. **Prompt for username**: The script asks for a new username.
2. **Validate input**: Ensures the username doesn't already exist.
3. **Update system files**:
   - Adds an entry to `/etc/passwd`.
   - Creates a home directory (`/home/<username>`).
   - Updates `/etc/group` to assign a group.
4. **Set permissions**: Ensures the home directory has correct ownership.

## Usage 🚀

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Add_User_Manually.git
   cd Add_User_Manually
