# verifies that the destroyed machine was from this module
# @s = machine block marker
# located at @s
# run from #gm4_machines:destroy

execute if entity @s[tag=gm4_soul_glass] unless block ~ ~ ~ moving_piston run function gm4_soul_glass:machine/destroy
