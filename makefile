# Define the find command to locate files to delete
FIND_CMD := find . -type f \
    -not -path "**/.git/*" \
    -not -path "**/.stack-work/*"\
    -not -name "*.md" \
    -not -name "*.txt" \
    -not -name "*.hs" \
    -not -name ".gitignore"\
    -not -name "makefile"\
    -not -name "**/*.yaml"

# Clean target to delete the files
clean:
	@echo "Cleaning up compiled files..."
		$(FIND_CMD) -exec rm -f {} \;; \
	@echo "Cleanup complete."

.PHONY: clean
