# give player absorption effect based on their score in gm4_ce_absorp
# @s = player to grant shield
# at unspecified
# run from armor/modifier/type/reactive/add_level
# run from player/process

# remove one to match absorption level and store
execute store result storage gm4_combat_expanded:temp player_shield.shield int 1 run scoreboard players remove @s gm4_ce_absorp 1

# apply absorption
function gm4_combat_expanded:player/shield/eval with storage gm4_combat_expanded:temp player_shield

# cleanup
data remove storage gm4_combat_expanded:temp player_shield.shield
scoreboard players reset @s gm4_ce_absorp
