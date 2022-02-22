# run from player/process
# @s = player to heal
# code taken from sweethearts

function gm4_armor_identification:player/calculate_hp

# calculate heal unless player at full health
execute unless score $max_health gm4_ai_data = @s gm4_ai_health run function gm4_armor_identification:player/heal/activate

# heal player
effect give @s minecraft:instant_health 1 10 true

# cleanup
scoreboard players reset @s gm4_ai_healstore
