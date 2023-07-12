#!/bin/bash

display_menu() {
	
    echo "How satisfied are you with our product: "	
    read product
    echo "Would you recommend our service to others? "
    read recommendation
    echo "How likely are you to purchase from us again? "
    read customer

    clear
    echo "Emoji Selector"
    clear
    echo "Menu:"
    echo "1. Smiling Face"
    echo "2. Thumbs Up"
    echo "3. Heart"
    echo "4. Cat"
    echo "5. Exit"
    echo
    read -p "Enter your choice: " choice
}

#  displays emoji
display_emoji() {
    local emoji=$1
    echo "Selected Emoji: $emoji"
    echo
    read -n 1 -s -r  -p "Press any key to continue..."
}

# while loop

while true; do
    display_menu

    case $choice in
        1) display_emoji "😃";;
        2) display_emoji "👍";;
        3) display_emoji "❤️";;
        4) display_emoji "🐱";;
        5) echo "Exiting..."; break;;
        *) echo "Invalid choice!";;
    esac
done






