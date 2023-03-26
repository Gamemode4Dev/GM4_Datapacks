# add charge this this flowering coral vine
# @s = flowering coral vine
# at @s
# run from fish/discharge

scoreboard players add @s gm4_hy_charge 1
execute if score @s gm4_hy_charge matches ..4 align xyz as @e[type=block_display,tag=gm4_hy_coral_flower,tag=!gm4_hy_coral_flower.charged,dx=0,dy=0,dz=0,limit=1,sort=random] run function gm4_hydromancy:coral_vine/flower/charge_bud
execute if score @s gm4_hy_charge matches 5.. run function gm4_hydromancy:coral_vine/flower/discharge

particle happy_villager ~ ~ ~ 0.3 0.3 0.3 0.1 16
playsound block.crop.break block @a ~ ~ ~ 1 0.75
