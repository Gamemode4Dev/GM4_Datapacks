# check if a home bed should reduce difficulty
# @s = home bed marker
# at unspecified
# run from mob/init/initiate

# find the linked player and get their sleep.version
scoreboard players operation $check_id gm4_ce_data = @s gm4_ce_id
scoreboard players set $check_version gm4_ce_data -1
execute as @a if score @s gm4_ce_id = $check_id gm4_ce_data run scoreboard players operation $check_version gm4_ce_data = @s gm4_ce_sleep.version

# if beds player is not online stop
execute if score $check_version gm4_ce_data matches -1 run return 0

# if bed is the current bed return success
execute if score @s gm4_ce_sleep.version = $check_version gm4_ce_data at @s if block ~ ~ ~ #minecraft:beds run scoreboard players set $nearby_home_bed gm4_ce_data 1
execute if score $nearby_home_bed gm4_ce_data matches 1 run return 1

# if bed is not the current bed but is linked to this player remove it
kill @s
