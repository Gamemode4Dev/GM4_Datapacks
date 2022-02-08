# starts ender bolt on nearby entities
# @s = player using ender bolt (dealt damage)
# at @s
# run from advancement gm4_ender_bolt_shamir:use

# revoke advancement
advancement revoke @s only gm4_ender_bolt_shamir:use

# spread
scoreboard players operation @s gm4_ender_bolt_foreign_id = @s gm4_ender_bolt_own_id
execute if entity @s[gamemode=!spectator] positioned ^ ^ ^2 run function gm4_ender_bolt_shamir:infection/spread
