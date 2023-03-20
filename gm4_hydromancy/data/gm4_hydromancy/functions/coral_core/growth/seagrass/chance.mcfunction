# chance to grow this seagrass to tall seagrass
# @s = growth marker
# at @s
# run from coral_core/growth/raycast

scoreboard players set $raycast_limit gm4_hy_data 0

# 10% chance to grow to tall seagrass
execute if block ~ ~ ~ seagrass if block ~ ~1 ~ water if predicate gm4_hydromancy:chance/seagrass_growth run function gm4_hydromancy:coral_core/growth/seagrass/grow
