# @template gm4:test_platform
# @dummy ~ ~1 ~
# @timeout 400

setblock ~ ~1 ~2 decorated_pot
give @s oak_leaves
rotate @s facing ~.5 ~ ~2
execute at @s run dummy @s use block ~ ~ ~2
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_blossoming_pots:interact_with_decorated_pot
await entity @e[type=block_display,tag=gm4_blossoming_pots.display.decorated_pot,distance=..3]
