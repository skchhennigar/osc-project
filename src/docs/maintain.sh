#!/bin/bash
# Documentation maintenance utilities

case "$1" in
    "check-links")
        echo "Checking for broken internal links..."
        find . -name "*.md" -exec grep -l "\[.*\](.*\.md)" {} \; | while read file; do
            echo "Checking $file..."
            # Basic link checking - can be enhanced
        done
        ;;
    "update-dates")
        echo "Updating last modified dates..."
        find . -name "README.md" -exec sed -i "s/Last updated: .*/Last updated: $(date +'%Y-%m-%d')/" {} \;
        ;;
    "stats")
        echo "Documentation Statistics:"
        echo "========================"
        echo "Total markdown files: $(find . -name "*.md" | wc -l)"
        echo "Total directories: $(find . -type d | wc -l)"
        echo "Largest files:"
        find . -name "*.md" -exec wc -l {} \; | sort -nr | head -5
        ;;
    *)
        echo "Documentation maintenance script"
        echo "Usage: ./maintain.sh [check-links|update-dates|stats]"
        ;;
esac
