
scoreboard players add $tick gm4_ce_boss 1

execute unless score $tick gm4_ce_boss matches 5.. as @a at @s run playsound block.amethyst_block.break hostile @s ~ ~ ~ 1 1.3
execute if score $tick gm4_ce_boss matches 5.. as @a at @s run playsound block.amethyst_block.break hostile @s ~ ~ ~ 1.5 0.7

execute unless score $tick gm4_ce_boss matches 5.. as @e[tag=gm4_ce_boss.crystal] at @s run tp @s ~ ~ ~ facing entity @p eyes
execute unless score $tick gm4_ce_boss matches 5.. as @e[tag=gm4_ce_boss.crystal] at @s run tp @s ~ ~ ~ ~ ~10

execute unless score $tick gm4_ce_boss matches 2..3 run schedule function gm4_combat_expanded:boss/running/clock 10t
execute if score $tick gm4_ce_boss matches 2..3 run schedule function gm4_combat_expanded:boss/running/clock 5t

execute if score $tick gm4_ce_boss matches 5.. run scoreboard players set $tick gm4_ce_boss 0
