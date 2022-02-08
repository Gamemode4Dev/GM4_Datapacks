# gives pets the ender bolt id of their owner
# @s = a pat that has not yet received an ender bolt id
# run from gm4_ender_bolt_shamir:infection/check_ignore_list

execute store result score @s gm4_ender_bolt_own_id run data get entity @s Owner[3]
