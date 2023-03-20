# add charge this this budded coral vine
# @s = budded coral vine
# at @s
# run from fish/discharge

scoreboard players add @s gm4_hy_charge 1
execute if score @s gm4_hy_charge matches ..4 as @e[type=block_display,tag=gm4_hy_coral_bud,tag=!gm4_hy_bud.charged,dx=0,dy=0,dz=0,limit=1,sort=random] run function gm4_hydromancy:coral_vine/bud/check_side
execute if score @s gm4_hy_charge matches 5 run function gm4_hydromancy:coral_vine/bud/discharge
