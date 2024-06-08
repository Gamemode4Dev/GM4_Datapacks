# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from clocks/player_process
# run from armor/modifier/type/link/process/set_health

function gm4_ce_base:player/calculate_hp

# calculate heal
function gm4_ce_base:player/heal/activate

# heal player
effect give @s minecraft:instant_health 1 10 true

# cleanup
scoreboard players reset @s gm4_ce_healstore
