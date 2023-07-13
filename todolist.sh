#!/bin/bash

# Name of the to-do list file
todo_file="todo.txt"

# Check if the to-do list file exists, create it if not
if [ ! -e "$todo_file" ]; then
    touch "$todo_file"
fi

# Function to add a task to the to-do list
add_task() {
    echo "$1" >> "$todo_file"
    echo "Task added: $1"
}

# Function to delete a task from the to-do list
delete_task() {
    if sed -i.bak "/$1/d" "$todo_file"; then
        echo "Task deleted: $1"
    else
        echo "Task not found: $1"
    fi
}

# Function to display the current to-do list
display_list() {
    if [ -s "$todo_file" ]; then
        echo ""
        echo "╔═════════════════════╗"
        echo "║     TO-DO LIST      ║"
        echo "╠═════════════════════╣"
        cat -n "$todo_file" | sed -e 's/^/║  /'
        echo "╚═════════════════════╝"

    else
        echo "Your to-do list is empty!"
    fi
}

# Main menu
while true; do
    echo ""
    echo "╔═════════════════════╗"
    echo "║     TO-DO LIST      ║"
    echo "╠═════════════════════╣"
    echo "║ 1. Add Task         ║"
    echo "║ 2. Delete Task      ║"
    echo "║ 3. Display To-Do    ║"
    echo "║    List             ║"
    echo "║ 4. Exit             ║"
    echo "╚═════════════════════╝"
    read -p "Enter your choice (1-4): " choice


    clear;

    case $choice in

        1)
            read -p "Enter task description: " task
            add_task "$task"
            ;;
        2)
            read -p "Enter task to delete: " task
            delete_task "$task"
            ;;
        3)
            display_list
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
