# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from player/process
# run from armor/modifier/type/link/process/set_health

# calc hp and remove the healstore to get the actual current health
function gm4_survival_refightalized:player/health/calculate_hp
scoreboard players operation @s gm4_sr_health.current -= @s gm4_sr_healstore

# calculate heal
function gm4_survival_refightalized:player/health/heal/activate

# heal player
effect give @s minecraft:instant_health 1 10 true

# cleanup
scoreboard players reset @s gm4_sr_healstore
