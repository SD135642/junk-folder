# junk-folder
The Junk Management Script is a simple Bash script that moves supplied files to a designated "junk" directory for later review or deletion.

### Features

    File Management: Move files and directories to a designated "junk" directory.
    List Junked Files: View a list of files currently stored in the "junk" directory.
    Purge All Files: Permanently remove all files from the "junk" directory.

### Usage

To use the script, run the following command:

    ./junk.sh [options] [list of files]

    Options:
        -h: Display help.
        -l: List junked files.
        -p: Purge all files.

### Notes:
        The script supports the junking of both files and directories.
        The script expects a directory named .junk to be present in the user's home directory (HOME/.junk). If it doesn't exist, the script will create it.

### Important
Ensure that the script has execute permissions. If not, you can grant it using:

    chmod +x junk.sh
    
Be careful when testing the script so as not to delete any important files.

### Author
Aleksandra Dubrovina

### Contact
For inquiries or feedback, please contact aleks.dubrovina@gmail.com.
