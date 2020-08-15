# @s = trash_can
# run from main

# Checks if trash can has items inside it
function gm4_trash_cans:check_dropper

# Keep armorstand lit up
data merge entity @s {Fire:2000}

# Destroy trash can if broken
execute unless block ~ ~ ~ dropper run function gm4_trash_cans:destroy
