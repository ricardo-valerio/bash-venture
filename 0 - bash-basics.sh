#!/usr/local/Cellar/bash/4.4.19/bin/bash

# comments are exactly like python

# to run a script we need to give it executable permissions
# chmod +x [NAME_OF_THE_FILE.sh]

#####################################################
# variables have to be exactly like that...
# the equal sign has no space before or after it
greeting="Hello"
year_of_tokyo_olympics=2020

# without single or double quotes we have to escape
echo $greeting, \(planet\) earth!

# prints exactly what's inside..and don't eval vars
echo '$greeting, (planet) earth!'

# evaluate vars and prints everything nice and easy
echo "$greeting, (planet) earth!"


echo "Tokyo Olympics will be in $year_of_tokyo_olympics"



#####################################################
# stuff we can do with variables:
#####################################################
declare -i number_of_keys_a_piano_has=88 # integer
declare -r piano_brand="Yamaha"          # read-only
declare -u upper_case_variable="LolcAts"
declare -l lower_case_variable="LolcAts"

echo $number_of_keys_a_piano_has
echo $piano_brand
echo $upper_case_variable
echo $lower_case_variable

#####################################################
# There are hundreds of built-in variables:
# these are just a few
#####################################################
echo $HOME
echo $PWD
echo $MACHTYPE
echo $HOSTNAME


#####################################################
# "command substitution" aka commands in variables
#####################################################
ping_commd=$(ping -c 1 google.com | grep 'bytes from' | cut -d = -f 4)
echo "The ping was $ping_commd"

#####################################################
# arithmetics operations
#####################################################
a=2
b=5
addition=$(( $a + $b ))
subtraction=$(( $a - $b ))
multiplication=$(( $a * $b ))
exponentiation=$(( $a ** $b ))
integer_division=$(( $a / $b ))
# this is a hacky way using command sub
real_division=$( echo $a/$b | bc -l )
modulo=$(( $a % $b ))
addition=$(( $a + $b ))

echo $addition
echo $subtraction
echo $multiplication
echo $exponentiation
echo $integer_division
echo $real_division
echo $modulo
echo $addition

((a++)) # increment
((b--)) # decrement
((a+=5))
((b-=2))
((a/=5))
((b*=2))
((b%=2))
echo $a
echo $b

#####################################################
# comparisons returned values:
#####################################################
# FAILURE: 1  (FALSE)
# SUCCESS: 0  (TRUE)

[[ $a -gt $b ]]
echo "$a > $b, Result: " $?

[[ $a -ge $b ]]
echo "$a >= $b, Result: " $?

[[ $a -lt $b ]]
echo "$a < $b, Result: " $?

[[ $a -le $b ]]
echo "$a <= $b, Result: " $?

[[ $a -eq $b ]]
echo "$a == $b, Result: " $?

[[ $a -ne $b ]]
echo "$a != $b, Result: " $?


#####################################################
# Boolean operators
#####################################################

# AND
[[ $a && $b ]]
echo "$a && $b, Result: " $?

# OR
[[ $a || $b ]]
echo "$a || $b, Result: " $?

# NOT
[[ ! $b ]]
echo "! $b, Result: " $?


#####################################################
# string operators and operations
#####################################################

# IS NULL?
[[ -z $piano_brand ]]
echo "-z $piano_brand, Result: " $?

# IS NOT NULL?
[[ -n $piano_brand ]]
echo "-n $piano_brand, Result: " $?


m="Mari"
j="Juana"
mj=$m$j # concatenation
echo $mj

# string length
echo ${#j}
echo ${#mj}

# slices
echo ${mj:2}   # from index 2 to the end
echo ${mj:2:4} # from index 2 and output 4 chars
echo ${mj: -4} # counting from the end like python
echo ${mj: -4:3}

fruits="apple pineapple banana banana strawberry"
# replace the first occurence of "banana" with "coconut"
echo ${fruits/banana/coconut}
# to replace both occurences of "banana":
echo ${fruits//banana/coconut}

# using modifiers to select specific locations of the string
# replace if apple is in the beggining of the string
echo ${fruits/#apple/watermelon}
# replace if banana is in the beggining of the string
echo ${fruits/#banana/watermelon}

# replace if strawberry is in the end of the string
echo ${fruits/%strawberry/watermelon}
# replace if banana is in the end of the string
echo ${fruits/%banana/watermelon}

# using matching special chars
# replace all that start with b
echo ${fruits/b*/watermelon}


#####################################################
# terminal color outputs
#
#      COMMAND         |        STYLE
#####################################################
#   tput setaf [0-7]   |    Foreground
#   tput setab [0-7]   |    Background
#   tput sgv0          |    None Style
#   tput bold          |    Bold
#   tput dim           |    Low intensity
#   tput blink         |    Blinking
#   tput rev           |    Reverse
#####################################################
# to find more commands type: man terminfo
#####################################################

#####################################################
#  COLOR   |  NºCODE for setab or setaf
#####################################################
#  Black   |           0
#  Red     |           1
#  Green   |           2
#  Yellow  |           3
#  Blue    |           4
#  Magenta |           5
#  Cyan    |           6
#  White   |           7

# Example
flash_red=$( tput setab 0; tput setaf 1; tput blink )
red=$( tput setab 0; tput setaf 1 )
none=$( tput sgr0 )
echo -e $flash_red"ERROR: "$none$red"Something went wrong."$none



#####################################################
# Helpers
#####################################################

date_of_today=$( date +"%d-%m-%Y" )
current_time=$( date +"%H:%M:%S" )
# -v specifies the output to a variable
printf -v my_date_variable "Current User:\t%s\nDate:\t%s @ %s\n" $USER $date_of_today $current_time
echo "$my_date_variable"

# more information about the printf specifiers:
# https://wiki.bash-hackers.org/commands/builtin/printf




#####################################################
# Arrays
#####################################################
my_empty_array=()

# NOTICE: there are no commas
my_array_with_fruits=("apple" "banana" "pineapple" "kiwi")

# Arrays are zero index based
echo ${my_array_with_fruits[0]}
echo ${my_array_with_fruits[1]}
echo ${my_array_with_fruits[2]}
echo ${my_array_with_fruits[3]}

# we can add stuff to the array even specifying an index
# that's far away LOL
my_array_with_fruits[8]="strawberry"

# We can append stuff to the end of the array
my_array_with_fruits+=("orange")

# Output the whole array with @
echo ${my_array_with_fruits[@]}
# Output the last one
echo ${my_array_with_fruits[@]: -1}

# Associative arrays
declare -A my_associative_fruits_array

my_associative_fruits_array["banana color"]="Yellow"
my_associative_fruits_array["kiwi color"]="Green of course."

echo "A banana is ${my_associative_fruits_array["banana color"]} and a kiwi is ${my_associative_fruits_array["kiwi color"]}"


#####################################################
# Working with files
#####################################################

# redirecting output to a file
echo "Some Random Text" > random_file.txt
# show the file
echo $( cat random_file.txt )
# If we use > again the previous text is lost
echo "Clean the file and write this" > random_file.txt
# show the file bro
echo $( cat random_file.txt )


# therefore making the file empty is easy
echo  > random_file.txt
# show the file again to see NOTHING
echo $( cat random_file.txt )


# We can also append text to it
echo "Hello" >> random_file.txt
echo $( cat random_file.txt )

echo "World" >> random_file.txt
echo $( cat random_file.txt )

# read contents from  a specified file, line by line
line=1
while read f
do
    echo "Line $line: $f"
    ((line++))
done < "0 - bash-basics.sh" # this file xD AHAHAHHAH


# the previous loop is awesome...it means we can
# run commands that are listed in a text file like this:
while read f
do
    echo $( $f )
done < "file_with_commands.txt"



#####################################################
# Heredocs      LOL
#####################################################

cat << EndOFMyAwesomeString
Now I can write
Whatever I want...
This is like a doc string in Python
Multi-line strings
and yeah...it worls
EndOFMyAwesomeString

cat <<- EndOFMyAwesomeStringWithTabs
    Now I can write With tabs
    Because I specified this symbol: "<<-"

    How amazing is that?

    Multi-line strings
    yeah...they suck
EndOFMyAwesomeStringWithTabs



#####################################################
# Control Structures
#####################################################

# if statements

my_cute_number=5

if [ $my_cute_number -gt 10 ]; then
    echo "$my_cute_number is not greater than 10!"
elif [ $my_cute_number -gt 4 ]; then
    echo "$my_cute_number is greater than 4!"
fi


my_cute_string="This is an AM4ZING string!"

if [[ $my_cute_string =~ [0-9]+ ]]; then
    echo "There are numbers in the string: $my_cute_string"
else
    echo "There are NO numbers in there bro"
fi


# loops

i=0
while [ $i -le 10 ]; do
    echo "i: $i"
    ((i++))
done


#####################################################
# loop to open and close cd-rom tray
#####################################################
# while [[ 1 = 1 ]]; do
#     eject
#     eject -t
# done
#####################################################



# this one is kinda fun, it executes what is inside
# until the condition is true
# so in other words...it executes while it's false xD
j=0
until [ $j -ge 10 ]; do
    echo "j: $j"
    ((j++))
done


# loop like python sequences
for k in 1 2 3
do
    echo "k: $k"
done


# for loops like python with range function
for k in {1..20}
do
    echo "k: $k"
done

for k in {1..20..2}
do
    echo "k: $k"
done

# for loop like C
for(( v=0; v < 5; v++ ))
do
    echo "v: $v"
done

# looping command outputs
for l in $( tree )
do
    echo $l
done

# looping arrays
another_array_of_fruits=("banana" "kiwi" "orange")
for fruit in ${another_array_of_fruits[@]}
do
    echo "fruit: $fruit"
done


# looping associative arrays
declare -A people_identification
people_identification["first_person_name"]="Ricardo"
people_identification["first_person_id"]="19828468"
people_identification["second_person_name"]="Maxwell"
people_identification["second_person_id"]="89384973"

# NOTICE THE EXCLAMATION POINT TO ACCESS THE DICTIONARY
for key in "${!people_identification[@]}"
do
    echo "$key: ${people_identification[$key]}"
done



# switch

animal="dog"

case $animal in
    cat) echo "Feline!";;
    dog|puppy) echo "Canine";;
    *) echo "Other race, perhaps human?! lol";; # default
esac


#####################################################
# Functions
#####################################################

function say_hello()
{
    echo "Hello Flying Lemons!"
}
say_hello # function call without parentheses



function say_hello_to_fruit()
{
    # $1 represents the first argument passed
    # we can pass more if we want: $2, $3, etc
    echo "Hello Flying $1!"
}
say_hello_to_fruit "Kiwis"


function list_things()
{
    i=1
    for t in $@  # $@ is the stuff that we pass
    do
        echo "$i: $t"
        ((i++))
    done

}
list_things $( ls )
list_things "apple" "banana" "Melon" "Watermelon"




#####################################################
# Where to find more Bash info and Documentation:
#####################################################
# 1) man bash
# 2) https://www.gnu.org/software/bash/manual/bashref.html
# 3) https://wiki.bash-hackers.org/doku.php
# 4) https://tldp.org/LDP/abs/html/gotchas.html
# 5) stackoverflow and other online forums
#
# How to reference and import files in scripts:
# https://stackoverflow.com/questions/5228345/bash-script-how-to-reference-a-file-for-variables
#
#####################################################
