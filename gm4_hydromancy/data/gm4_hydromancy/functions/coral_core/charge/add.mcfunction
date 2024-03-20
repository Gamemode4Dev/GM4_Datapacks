# add charge to this coral core
# @s = coral core
# at @s
# run from coral_vine/flower/discharge

# add charge, enchant if it's full
scoreboard players add @s gm4_hy_charge 1
data modify entity @s[scores={gm4_hy_charge=20}] item.tag.Enchantments append value {id:"minecraft:mending",lvl:1s}

# vfx
particle block bubble_coral_block ~ ~-.3 ~ 0.25 0.1 0.25 0 18
playsound minecraft:block.conduit.activate block @a ~ ~ ~ 1 0.25

# charge circle
execute align xyz run kill @e[type=block_display,tag=gm4_hy_coral_core.charge_display,dx=0,dy=0,dz=0]
scoreboard players set $circle_steps gm4_hy_data 20
execute rotated ~-9 ~ run function gm4_hydromancy:coral_core/charge/display
tag @s add gm4_hy_target
execute align xyz as @e[type=block_display,tag=gm4_hy_coral_core.charge_display,dx=0,dy=0,dz=0] at @s run tp @s ~ ~.1 ~ facing entity @e[type=item_display,tag=gm4_hy_target,limit=1]
tag @s remove gm4_hy_target
