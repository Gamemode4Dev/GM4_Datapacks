# spreads ender bolt to nearby entities
# @s = varies, either player starting ender bolt or an infected entity
# at @s
# run from infection/start and infection/active

# remember self
tag @s add gm4_bolt_owner

# spread
execute as @e[distance=..1.6,team=!gm4_invalid,tag=!gm4_bolt_owner,type=!armor_stand] unless score @s gm4_bolt_time matches -40.. run scoreboard players set @s gm4_bolt_time 10

# reset tag
tag @s remove gm4_bolt_owner
