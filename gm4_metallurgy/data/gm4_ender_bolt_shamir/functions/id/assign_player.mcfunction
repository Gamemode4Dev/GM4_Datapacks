# @s = player who joined for the first time
# run from advancement gm4_ender_bolt_shamir:join

execute store result score @s gm4_ender_bolt_own_id run data get entity @s UUID[3]
