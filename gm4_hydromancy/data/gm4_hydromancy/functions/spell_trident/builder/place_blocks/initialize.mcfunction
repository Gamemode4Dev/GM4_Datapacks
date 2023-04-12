# prep the placement of blocks by storing the required command in marker entities
# @s = block display
# at @s
# run from spell_trident/on_land/cast

# remove any block displays left past 25
kill @e[type=block_display,tag=gm4_hy_builder.new]

# store command in a nearby marker
execute at @e[type=block_display,tag=gm4_hy_builder.need_command] run summon marker ~ ~ ~ {Tags:["gm4_hy_builder.command_storage","gm4_hy_builder.need_command"]}
execute as @e[type=marker,tag=gm4_hy_builder.need_command] run data modify entity @s data.gm4_hydromancy.stored_command set from storage gm4_hydromancy:temp builder.stored_command
tag @e remove gm4_hy_builder.need_command

# tag origin to start the growth
execute unless entity @e[type=block_display,tag=gm4_hy_builder.growing] run schedule function gm4_hydromancy:spell_trident/builder/place_blocks/clock 1t
tag @e[type=block_display,tag=gm4_hy_builder.origin] add gm4_hy_builder.growing
tag @e remove gm4_hy_builder.origin
