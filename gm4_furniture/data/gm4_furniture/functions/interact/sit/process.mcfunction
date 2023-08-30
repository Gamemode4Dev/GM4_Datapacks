# get interacting player to sit at this furniture block
# @s = furniture's interacted interaction entity
# at @s
# run from interact/process

# make player ride the linked item_display (if this is not the main interaction entity item_display will be invisible)
# the item_display is offset from the ground to dictate sit height
ride @p[tag=gm4_furniture_target] dismount
ride @p[tag=gm4_furniture_target] mount @e[type=item_display,tag=gm4_furniture,dx=0,dy=0,dz=0,limit=1]

# mark interaction as resolved
scoreboard players set $interaction_processed gm4_furniture_data 1
