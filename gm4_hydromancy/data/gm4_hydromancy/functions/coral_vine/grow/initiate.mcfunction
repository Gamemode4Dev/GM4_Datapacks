
# try to grow a vine
execute as @e[type=marker,tag=gm4_hy_coral_vine.can_grow,dx=14,dy=7,dz=14,limit=1,sort=random] at @s run function gm4_hydromancy:coral_vine/grow/try_growth

# if coral flower has 0 vines find a new start
execute unless score @s[scores={gm4_hy_vine_root_count=0}] gm4_hy_vine_count matches 0 at @s run function gm4_hydromancy:coral_vine/grow/fresh_vine

# if there are more vine blocks than root blocks expand root
# possible growth locations can overlap if there are multiple root blocks bordering it, giving increased chances of growth there
execute if score @s gm4_hy_vine_count > @s gm4_hy_vine_root_count as @e[type=marker,tag=gm4_hy_coral_vine.rooted,dx=14,dy=1,dz=14] at @s run function gm4_hydromancy:coral_vine/grow/root
execute as @e[type=marker,tag=gm4_hy_possible_root_growth,limit=1,sort=nearest] at @s run function gm4_hydromancy:coral_vine/grow/growth
kill @e[type=marker,tag=gm4_hy_possible_root_growth]
