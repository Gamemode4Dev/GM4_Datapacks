# spreads ender bolt to nearby entities
# @s = varies, either player starting ender bolt or an infected entity
# at @s
# run from infection/start and infection/active

# remember infection source id
scoreboard players operation $source gm4_ender_bolt_foreign_id = @s gm4_ender_bolt_foreign_id

# spread
execute as @e[distance=..1.6,team=!gm4_invalid,type=!armor_stand,tag=!smithed.strict] unless score @s gm4_bolt_time matches -40.. run function gm4_ender_bolt_shamir:infection/check_ignore_list
