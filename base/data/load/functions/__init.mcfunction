# If you are a user of this library, do not modify this function, or you risk
# causing compatibility issues with other data packs. If you have a good reason
# to *add* something, feel free to make an issue on the GitHub for this project:
# https://github.com/LanternMC/Load

# Add the common objective to be used for version resolution.
scoreboard objectives add load dummy

# Reset all scores on this objective to allow for version resolution on reload.
scoreboard players reset * load

# Call a nonexistent function to allow for this data pack to be extended later.
function load:__init2
