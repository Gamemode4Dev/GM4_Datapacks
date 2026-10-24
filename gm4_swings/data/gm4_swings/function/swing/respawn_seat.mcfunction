scoreboard players operation $global gm4_swings.id = @s gm4_swings.id

data modify storage gm4_swings:temp swings.rotation set from entity @s Rotation[0]
execute rotated as @s positioned ^ ^-5.5 ^ run function gm4_swings:seat/create with storage gm4_swings:temp swings
