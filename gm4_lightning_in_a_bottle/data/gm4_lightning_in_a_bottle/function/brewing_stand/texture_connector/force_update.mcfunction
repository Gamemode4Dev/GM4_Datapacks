# forces nearby texture_connectors to update
# @s = player who has placed a lightning rod on a brewing stand
# at @s
# run from advancement place_lightning_rod

# revoke advancement
advancement revoke @s only gm4_lightning_in_a_bottle:place_lightning_rod

# update nearby brewing stands to check for texture connectors
execute as @e[type=marker,tag=gm4_brewing_stand,distance=..8] at @s run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/check_structure
