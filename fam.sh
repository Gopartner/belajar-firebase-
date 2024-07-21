#!/bin/bash

## Firebase Account Manager (FAM). created by yudibilly

function show_menu() {
    echo "Firebase Account Management"
    echo "1. Show login status"
    echo "2. Add account"
    echo "3. Remove account"
    echo "4. Switch account"
    echo "5. Exit"
    echo -n "Enter your choice: "
    read choice
}

function show_login_status() {
    clear
    echo "Currently logged in accounts:"
    firebase login:list
    echo
    echo "====================================="
}

function add_account() {
    echo "Adding a new account..."
    firebase login:add
    echo "Please complete the login process in the browser window that opens."
}

function remove_account() {
    echo -n "Enter the email of the account to remove: "
    read email
    echo "Removing account $email..."
    firebase logout --email "$email"
}

function switch_account() {
    echo -n "Enter the email of the account to switch to: "
    read email
    echo "Switching to account $email..."
    firebase login:use "$email"
}

while true; do
    show_menu
    case $choice in
        1)
            show_login_status
            ;;
        2)
            add_account
            ;;
        3)
            remove_account
            ;;
        4)
            switch_account
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 5."
            ;;
    esac
done

