# code taken from sweethearts
# @s = player to heal
# at world spawn
# run from player/process

function gm4_combat_expanded:player/calculate_hp

# calculate heal unless player at full health
execute unless score $max_health gm4_ce_data = @s gm4_ce_health run function gm4_combat_expanded:player/heal/activate

# heal player
effect give @s minecraft:instant_health 1 10 true

# cleanup
scoreboard players reset @s gm4_ce_healstore
