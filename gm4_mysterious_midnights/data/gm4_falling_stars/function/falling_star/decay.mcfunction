# tracks and decays falling stars. This is a saftey feature to prevent buildup of falling stars
# @s = players in the overworld during a falling star night
# at @s
# run from gm4_falling_stars:event

# track age
scoreboard players add @s gm4_fstar_decay 1

# remove old falling stars
execute if score @s gm4_fstar_decay matches 15.. run kill @e[type=#gm4_falling_stars:falling_star,tag=gm4_falling_star,distance=..2]
