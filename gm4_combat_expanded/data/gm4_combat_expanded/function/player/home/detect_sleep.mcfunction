# process a player sleeping in a bed
# @s = sleeping player
# at @s
# run from player/process

# reset score to check for sleep again
scoreboard players reset @s gm4_ce_sleep

# check if a nearby bed already has this players bed marker
scoreboard players operation $id gm4_ce_data = @s gm4_ce_id
execute as @e[type=marker,tag=gm4_ce_bed,distance=..8,sort=nearest] if score @s gm4_ce_id = $id gm4_ce_data run return 0

# increase sleep.version so old sleep markers no longer work
execute store result score $sleep_version gm4_ce_sleep.version run scoreboard players add @s gm4_ce_sleep.version 1

# kill any old bed marker for this player
execute as @e[type=marker,tag=gm4_ce_bed] if score @s gm4_ce_id = $id gm4_ce_data run kill @s

# spawn a new bed marker if there wasn't one found
execute summon marker run function gm4_combat_expanded:player/home/init_bed
