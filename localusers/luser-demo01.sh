#!/bin/bash

# This script displays various info to the screen.
# Display #!
echo '# sharp + ! bang = #! shebang'

# Assign a value to a variable
WORD='script'

# Display that value using the variable (in convention, all upper case)
echo "$WORD"

# Combine the variable with hard-cided text.
echo "This is a shell $WORD"
echo "This is a shell ${WORD}"

# Append text to the variable
echo "${WORD}ing is fun." 

ENDING='ed'

echo "This is ${WORD}${ENDING}."

# Reassignment
ENDING='ing'
echo "This is ${WORD}${ENDING}."

