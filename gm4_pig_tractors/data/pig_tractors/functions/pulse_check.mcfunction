#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = pig_tractors gm4_clockTick run function pig_tractors:main
execute as @a[tag=gm4_has_hoe] at @s if block ~ ~ ~ #pig_tractors:crops run function pig_tractors:check_crop
execute as @a[tag=gm4_has_hoe] at @s positioned ~ ~-0.5 ~ if block ~ ~ ~ #pig_tractors:tillable run function pig_tractors:till
