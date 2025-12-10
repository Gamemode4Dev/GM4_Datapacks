# damage player hit by flare
# @s = player
# at near @s
# run from mob/process/elite/blazing/flare_explode

execute store result score $showDeathMessages gm4_mu_data run gamerule show_death_messages
gamerule show_death_messages false
damage @s 5 explosion
tag @s add gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 at @s unless entity @e[type=player,tag=gm4_mu_self,distance=..0.1,limit=1] run tellraw @a ["",{"translate":"text.gm4.monsters_unbound.death.blazing_elite_flare","fallback":"%s was blown up by a Blazing Flare",with:[{"selector":"@s"}]}]
tag @s remove gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 run gamerule show_death_messages true
