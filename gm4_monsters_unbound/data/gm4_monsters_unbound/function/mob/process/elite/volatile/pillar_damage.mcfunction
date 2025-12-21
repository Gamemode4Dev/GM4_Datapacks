# damage from volatile pillar
# @s = player that was hit
# at near @s
# run from mob/process/elite/volatile/pillar_explode

effect give @s slowness 2 2
effect give @s nausea 4 0

execute store result score $showDeathMessages gm4_mu_data run gamerule show_death_messages
gamerule show_death_messages false
damage @s 9.0 explosion
tag @s add gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 at @s unless entity @e[type=player,tag=gm4_mu_self,distance=..0.1,limit=1] run tellraw @a ["",{"translate":"text.gm4.monsters_unbound.death.volatile_elite_meteorite","fallback":"%s was struck by a meteorite",with:[{"selector":"@s"}]}]
tag @s remove gm4_mu_self
execute if score $showDeathMessages gm4_mu_data matches 1 run gamerule show_death_messages true
