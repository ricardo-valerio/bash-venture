date
# Fri  2 Mar 2018 19:23:57 WET

cal
#      March 2018
# Su Mo Tu We Th Fr Sa
#              1  2  3
#  4  5  6  7  8  9 10
# 11 12 13 14 15 16 17
# 18 19 20 21 22 23 24
# 25 26 27 28 29 30 31

df -h # current amount of free space on your disk drives in human-readable form

free

#######################################
# THE CONSOLE BEHIND THE CURTAIN
#######################################
# Even if we have no terminal
# emulator running, several terminal
# sessions con- tinue to run behind
# the graphical desktop. Called
# virtual terminals or virtual
# consoles, these sessions can be
# accessed on most Linux
# distributions by pressing
# CTRL-ALT-F1 through CTRL-ALT-F6 on
# most systems. When a session is
# accessed, it presents a login
# prompt into which we can enter our
# username and password. To switch
# from one virtual console to
# another, press ALT and F1–F6. To
# return to the graphical desktop,
# press ALT-F7.

#######################################
# Filesystem Tree
#######################################
# Note that unlike Windows, which has a separate
# filesystem tree for each storage device, Unix-like
# systems such as Linux always have a single
# filesystem tree, regardless of how many drives or
# storage devices are attached to the computer.
# Storage devices are attached (or more correctly,
# mounted) at vari- ous points on the tree according
# to the whims of the system administrator, the
# person (or persons) responsible for the
# maintenance of the system.

# Changes the working directory to your home
# directory.
cd

# Changes the working directory to the previous
# working directory.
cd -

# Changes the working directory to the home
# directory of username. For example, cd ~bob
# changes the directory to the home directory of
# user bob.
cd ~RicardoValerio


################################################
# Important facts about filenames
################################################
# Linux has no concept of a “file extension” like
# some other operating sys- tems. You may name files
# any way you like. The contents and/or purpose of a
# file is determined by other means. Although
# Unix-like operating sys- tems don’t use file
# extensions to determine the contents/purpose of
# files, some application programs do.

# Though Linux supports long filenames that may
# contain embedded spaces and punctuation characters,
# limit the punctuation characters in the names of
# files you create to period, dash (hyphen), and
# underscore. Most impor- tantly, do not embed
# spaces in filenames. Embedding spaces in
# filenames will make many command line tasks more
# difficult, as we will discover in Chapter 7. If
# you want to represent spaces between words in a
# filename, use underscore characters. You will
# thank yourself later.


##############################################
# Commands
##############################################
# Most commands use options consisting of a single
# character preceded by a dash, such as -l. But many
# commands, including those from the GNU Project,
# also support long options, consisting of a word
# preceded by two dashes. Also, many commands allow
# multiple short options to be strung together.

# list files in long format and sort by time but reversed
ls -lt --reverse  # ls -ltr


##############################################
# Common "ls" options
##############################################
# option    long option    description
# -a          --all        list all files inclundig hidden
# -h          --human-readable    it shows the size nicely
# -r          --reverse           reverses the output order
# -S                              sort result by file size
# -t                              sort by modification time


# when we do:
ls -l
# total 248
# -rw-r--r--   1 RicardoValerio  staff  121434 28 Feb 02:50 Screen Shot 2018-02-26 at 15.32.23.png
# drwxr-xr-x   7 RicardoValerio  staff     224  2 Mar 20:29 books
# drwxr-xr-x  11 RicardoValerio  staff     352  2 Mar 15:52 code
# -rwxr-xr-x   1 RicardoValerio  staff    3707  2 Mar 20:36 the_linux_command_line_books_commands.sh

# we have a lot of useful info:
#########################################
#! -rw-r—r---
#
# Access rights to the file. The first character
# indicates the type of file. Among the different
# types, a leading dash means a regular file, while
# a d indicates a directory. The next three
# characters are the access rights for the file’s
# owner, the next three are for mem- bers of the
# file’s group, and the final three are for
# everyone else.
#########################################
#! 1
#
# File's number of hard links.
#########################################
#! RicardoValerio
#
# The user name of the file's owner
#########################################
#! staff
#
# the name of the group that owns the file
#########################################
#! 121434
#
# size of the file in bytes.
#########################################
#! 28 Feb 02:50
#
# date and time of the file's last modification.
#########################################
#! Screen Shot 2018-02-26 at 15.32.23.png
#
# name of the file.
#########################################

ls ~/RV-LAB/Python ~/RV-LAB/Bash  # list n directories (where n=2 here)



# As we dis- cussed earlier, filenames in Linux are
# not required to reflect a file’s con- tents. For
# example, while a filename like picture.jpg would
# normally be expected to contain a JPEG compressed
# image, it is not required to in Linux. We can
# invoke the file command this way:

file "Screen Shot 2018-02-26 at 15.32.23.png"
# Screen Shot 2018-02-26 at 15.32.23.png: PNG image data, 834 x 518, 8-bit/color RGBA, non-interlaced

# There are many kinds of files. In fact, one of the
# common ideas in Unix- like operating systems such
# as Linux is that “everything is a file.” As we
# pro- ceed with our lessons, we will see just how
# true that statement is.
# While many of the files on your system are
# familiar, for example MP3 and JPEG files, many
# kinds are a little less obvious, and a few are
# quite strange.


################################################
# Manipulating Files and directories
################################################


# cp      Copy files and directories.
# mv      Move/rename files and directories.
# mkdir   Create directories.
# rm      Remove files and directories.
# ln      Create hard and symbolic links.

# Because the shell uses file- names so much, it
# provides special characters to help you rapidly
# specify groups of filenames. These special
# characters are called wildcards. Using wildcards
# (also known as globbing) allows you to select
# filenames based on patterns of characters.

# WILDCARDS
# *               Any characters
# ?               Any single character
# [characters]    Any character that is a member of
#                 the set characters
# [!characters]   Any character that is not a member
#                 of the set characters
# [[:class:]]     Any character that is a member of
#                 the specified class

# COMMONLY USED CHARACTER CLASSES
# [:alnum:]     Any alphanumeric character
# [:alpha:]     Any alphabetic character
# [:digit:]     Any numeral
# [:lower:]     Any lowercase letter
# [:upper:]     Any uppercase letter

# Using wildcards makes it possible to construct very
# sophisticated selec- tion criteria for filenames.

# *       All files
# g*      Any file beginning with g
# b*.txt  Any file beginning with b followed by any
#         characters and ending with .txt
# Data??? Any file beginning with Data followed by
#         exactly 3 characters
# [abc]*  Any file beginning with either a, b, or c

# BACKUP.[0-9][0-9][0-9] Any file beginning with BACKUP
#                         followed by exactly 3 numerals

# [[:upper:]]* Any file beginning with an uppercase letter

# [![:digit:]]* Any file NOT beginning with a numeral
# *[[:lower:]123] Any file ending with a lowercase letter
# or the numerals 1, 2 or 3

mkdir my_new_awesome_directory
mkdir mydir1 my_dir2

cp file1.txt file2.txt
cp file1.txt to_some_directory/
cp file1.txt file2.txt file3.txt to_some_directory/


#######################################
# cp OPTIONS
#######################################
# -a, --archive
# Copy the files and directories and all of their
# attributes, including ownerships and permissions.
# Normally, copies take on the default attributes of the
# user per- forming the copy.

# -i, --interactive
# Before overwriting an existing file, prompt the user
# for confirmation. If this option is not specified, cp
# will silently overwrite files.

# -r, --recursive
# Recursively copy directories and their contents. This
# option (or the -a option) is required when copying
# directories.

# -u, --update
# When copying files from one directory to another, copy
# only files that either don’t exist or are newer than
# the existing corresponding files in the destination
# directory.

# -v, --verbose
# Display informative messages as the copy is performed.

#######################################
# cp EXAMPLES
#######################################
cp file1 file2
# Copy file1 to file2. If file2 exists, it is overwritten with the contents of file1. If file2 does not exist, it is created.

cp -i file1 file2
# Same as above, except that if file2 exists, the user is prompted before it is overwritten.

cp file1 file2 dir1
# Copy file1 and file2 into directory dir1. dir1 must already exist.

cp dir1/* dir2
# Using a wildcard, all the files in dir1 are copied into dir2. dir2 must already exist.

cp -r dir1 dir2
# Copy directory dir1 (and its contents) to directory dir2. If directory dir2 does not exist, it is created and will contain the same contents as directory dir1.



#######################################
# Move and Rename Files
#######################################
mv file1.4kv file1.txt # rename
mv file1.txt move_to_some_directory/
mv file1.txt file2.txt move_to_some_directory/
mv directory1/ move_to_some_directory/




#################################
# mv Options
################################
# -i, --interactive
# Before overwriting an existing file, prompt the user for confirmation. If this option is not specified, mv will silently overwrite files.

# -u, --update
# When moving files from one directory to another, move only files that either don’t exist in the destination
# directory or are newer than the existing corresponding files in the destination directory.

# -v, --verbose
# Display informative messages as the move is performed.


################################
# mv Examples
################################

mv file1 file2
# Move file1 to file2. If file2 exists, it is
# overwritten with the contents of file1. If file2
# does not exist, it is created. In either case,
# file1 ceases to exist.

mv -i file1 file2
# Same as above, except that if file2 exists, the
# user is prompted before it is overwritten.

mv file1 file2 dir1
# Move file1 and file2 into directory dir1. dir1
# must already exist.

mv dir1 dir2
# Move directory dir1 (and its contents) into
# directory dir2. If directory dir2 does not exist,
# create directory dir2, move the contents of
# directory dir1 into dir2, and delete directory
# dir1.



################################
# Remove files and Directories
################################

# Once you delete something with rm, it’s gone.
# Linux assumes you’re smart and you know what
# you’re doing.

# Be particularly careful with wildcards. Consider
# this classic example. Let’s say you want to delete
# just the HTML files in a directory. To do this,
# you type:

# rm *.html

# which is correct, but if you accidentally place a
# space between the * and the .html like so:

# rm * .html

# the rm command will delete all the files in the
# directory and then complain that there is no file
# called .html.

# Here is a useful tip: Whenever you use wildcards
# with rm (besides carefully checking your typing!),
# test the wildcard first with ls. This will let you
# see the files that will be deleted. Then press the
# up arrow key to recall the command and replace the
# ls with rm.



################################
# rm Options
################################

-i, --interactive
Before deleting an existing file, prompt the user for confirmation. If this option is not specified, rm will silently delete files.

-r, --recursive
Recursively delete directories. This means that if a directory being deleted has subdirectories, delete them too. To delete a directory, this option must be specified.

-f, --force
Ignore nonexistent files and do not prompt. This overrides the --interactive option.

-v, --verbose
Display informative messages as the deletion is performed.

################################
# rm Examples
################################

rm file1
# Delete file1 silently.
rm -i file1
# Before deleting file1, prompt the user for
# confirmation.
rm -r file1 dir1
# Delete file1 and dir1 and its contents.
rm -rf file1 dir1
# Same as above, except that if either file1 or dir1 does not exist, rm will continue silently.


################################
# Create Links
################################

# The ln command is used to create either hard or
# symbolic links. It is used in one of two ways:
ln file_or_directoly name_of_the_link
# to create a hard link and
ln -s file_or_directoly name_of_the_link
# to create a symbolic link where item is either a # file or a directory.

# HARD LINKS

# Hard links are the original Unix way of creating l
# inks; symbolic links are more modern. By default,
# every file has a single hard link that gives the
# file its name. When we create a hard link, we
# create an additional directory entry for a file.

# Hard links have two important limitations:
# 1)  A hard link cannot reference a file outside
# its own filesystem. This means a link cannot
# reference a file that is not on the same disk
# parti- tion as the link itself.
# 2) A hard link cannot reference a directory.

# A hard link is indistinguishable from the file
# itself. Unlike a directory list containing a
# symbolic link, a directory list containing a hard
# link shows no special indication of the link.

# When a hard link is deleted, the link is removed, but
# the contents of the file itself continue to exist
# (that is, its space is not deallocated) until all
# links to the file are deleted.

# It is important to be aware of hard links because
# you might encounter them from time to time, but
# modern practice prefers symbolic links, which we
# will cover next.

#################################################
# SYMBOLIC LINKS

# Symbolic links were created to overcome the
# limitations of hard links. Sym- bolic links work
# by creating a special type of file that contains a
# text pointer to the referenced file or directory.
# In this regard they operate in much the same way
# as a Windows shortcut, though of course they
# predate the Win- dows feature by many years. ;-)

# A file pointed to by a symbolic link and the
# symbolic link itself are largely indistinguishable
# from one another. For example, if you write some-
# thing to the symbolic link, the referenced file is
# also written to. However, when you delete a
# symbolic link, only the link is deleted, not the
# file itself. If the file is deleted before the
# symbolic link, the link will continue to exist but
# will point to nothing. In this case, the link is
# said to be broken. In many implementations, the ls
# command will display broken links in a
# distinguish- ing color, such as red, to reveal
# their presence.


#########################################
# Working with commands
########################################

# type    — Indicate how a command name is interpreted.
# which   — Display which executable program will be executed.
# man     — Display a command’s manual page.
# apropos — Display a list of appropriate commands.
# man -k [something_to_search_for] is the same as apropos
# info    — Display a command’s info entry.
# whatis  — Display a very brief description of a command.
# alias   — Create an alias for a command.






# STOP BOTHERING ME!!!
