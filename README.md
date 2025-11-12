# Shell Helpers

[![Language](https://img.shields.io/badge/language-Shell%20Script-blue.svg)](https://en.wikipedia.org/wiki/Shell_script)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![bash](https://img.shields.io/badge/bash-5.3-blue)](#) [![zsh](https://img.shields.io/badge/zsh-5.9-blue)](#)

A collection of useful helper functions for shell scripting, designed to make your scripts more robust, colorful, and user-friendly.

## Features

- **Colorful Logging**: A set of functions for logging messages with different levels (`INFO`, `WARN`, `ERROR`, `DEBUG`, etc.) and colors.
- **Color Functions**: Easily add foreground and background colors to your text.
- **Confirmation Prompt**: A `confirm` function to safely ask for user confirmation in interactive scripts.
- **Dependency Checking**: `ensure_commands` function to verify that required CLI tools are installed.
- **Utility Functions**: Various helpers for terminal interactions, titles, and environment setup.

## Prerequisites

These scripts have been tested with the following shell versions:

-   **Zsh**: `5.9` or higher
-   **GNU Bash**: `5.3.3` or higher

**Important:** The default `bash` version included with macOS (typically `3.2.57`) is **not** supported and may cause unexpected issues. It is highly recommended to use a modern version of Zsh or install a newer version of Bash (e.g., via Homebrew).

## Installation & Usage

To use these helper functions, simply source the `helpers.sh` script at the beginning of your own shell script:

```bash
#!/bin/bash

# Source the helpers
source "path/to/your/libs/helpers.sh"

# Now you can use the functions
info "This is an informational message."
warn "This is a warning."
error "This is an error."

if confirm "Do you want to proceed?"; then
  success "Great! Proceeding..."
else
  fatal "Operation aborted by the user."
fi
```

## Examples

### Logging

The logging functions print messages to `stderr` with appropriate colors and prefixes.

#### Log Levels

You can control the verbosity of the script's output by setting the `VERBOSITY` environment variable. The available levels are hierarchical:

-   `QUIET`: No logs are displayed.
-   `ERROR`: Only `error` and `fatal` messages are shown.
-   `WARN`: Shows `error`, `fatal`, and `warn`/`warning` messages.
-   `INFO` (Default): Shows `error`, `fatal`, `warn`, `info`, `success`, and `notice` messages.
-   `DEBUG`: Shows all messages except `verbose` and `trace`.
-   `VERBOSE`: Shows all messages except `trace`.
-   `TRACE`: Shows all messages.

If `VERBOSITY` is not set, it defaults to `INFO`.

```bash
#!/bin/bash

source "libs/helpers.sh"

# Set verbosity level (optional, defaults to INFO)
# Available levels: QUIET, ERROR, WARN, INFO, DEBUG, VERBOSE, TRACE
export VERBOSITY="DEBUG"

info "Starting the script..."
debug "This is a debug message, only shown if VERBOSITY is DEBUG or higher."
warn "A non-critical issue occurred."
error "Something went wrong!"
success "Operation completed successfully."
notice "This is a notice for the user."

# The fatal function will exit the script with status 1
fatal "A critical error occurred. Exiting."
```

### Coloring Text

You can easily color your text using the provided functions.

```bash
#!/bin/bash

source "libs/helpers.sh"

echo "This is the default color."
echo "$(red "This text is red.")"
echo "$(green "This text is green.")"
echo "$(blue "This text is blue.")"
echo "$(yellow "This is yellow text on a $(bg_red "red background").")"
echo "$(bright_cyan "This is bright cyan!")"
```

### Confirmation Prompt

Safely ask for user confirmation. The function handles non-interactive environments.

```bash
#!/bin/bash

source "libs/helpers.sh"

if confirm "Do you want to install the new package? [y/N]: "; then
    info "Installing package..."
    # Your installation logic here
else
    warn "Installation skipped."
fi
```

### Ensuring Dependencies

Check for required command-line tools at the start of your script.

```bash
#!/bin/bash

source "libs/helpers.sh"

# Check if 'jq' and 'glab' are available in the PATH
# The script will print an error and exit if they are not found.
ensure_dependencies jq glab

info "All required dependencies are installed."
# Continue with your script logic
```

## Function Reference

### Logging
- `success <message>`
- `notice <message>`
- `info <message>`
- `warning <message>` / `warn <message>`
- `error <message>`
- `fatal <message>` (exits the script)
- `debug <message>`
- `verbose <message>`
- `trace <message>`

### Colors
- **Foreground**: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, and `bright_*` versions.
- **Background**: `bg_black`, `bg_red`, `bg_green`, `bg_yellow`, `bg_blue`, `bg_magenta`, `bg_cyan`, `bg_white`, and `bg_bright_*` versions.

### Utilities
- `confirm [prompt]`
- `ensure_commands <cmd1> [cmd2] ...`
- `ensure_dependencies <cmd1> [cmd2] ...` (also sets up GitLab token)
- `printtitle <title>`
- `has_tty_available`
- `may_color`

---

## Support

If you find this collection of helpers useful, please consider supporting my work.

<a href="https://www.buymeacoffee.com/caherrera" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
