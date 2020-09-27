# @s = trash_can
# run from main

# Checks if trash can is disabled
function gm4_trash_cans:check_disable

# Check the rate of deletion and delete items
execute unless entity @s[tag=gm4_trash_disabled] if data block ~ ~ ~ Items[0] run function gm4_trash_cans:check_rate

# Visuals (Not disabled, Powered)
execute unless entity @s[tag=gm4_trash_disabled] run particle flame ~ ~1.1 ~ 0 0 0 0.01 1
execute if block ~ ~ ~ dropper[triggered=true] run particle dust 1 0 0 1 ~ ~1.1 ~ 0 0 0 0.05 1

# Keep armorstand lit up
data merge entity @s {Fire:2000}

# Destroy trash can if broken
execute unless block ~ ~ ~ dropper run function gm4_trash_cans:destroy
