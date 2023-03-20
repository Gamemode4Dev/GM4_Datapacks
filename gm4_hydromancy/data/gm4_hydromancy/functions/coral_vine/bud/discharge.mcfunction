# send charge from this budded coral vine to coral flower
# @s = budded coral vine
# at @s
# run from coral_vine/bud/charge

# TODO: particles to central coral flower
scoreboard players add @e[type=item_display,tag=gm4_hy_coral_flower,limit=1,sort=nearest] gm4_hy_charge 1
# limit of 12 blocks
scoreboard players set $raycast_limit gm4_hy_data 120
execute facing entity @e[type=item_display,tag=gm4_hy_coral_flower,limit=1,sort=nearest] eyes summon marker run function gm4_hydromancy:coral_vine/bud/raycast

# kill this vine block
function gm4_hydromancy:coral_vine/die
