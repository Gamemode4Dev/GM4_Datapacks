# handles entities bleeding to death
# @s = entity who died by bleeding to death from barbed damage
# at @s
# run from barbed/bleed

# death message
execute if entity @s[type=player] run tellraw @a ["",{"translate":"text.gm4.reeling_rods.death.bleeding","fallback":"%s succumbed to their injuries",with:[{"selector":"@s"}]}]
execute unless entity @s[type=player] on owner run tag @s add gm4_reeling_rods.owner
execute unless entity @s[type=player] run tellraw @p[tag=gm4_reeling_rods.owner] ["",{"translate":"text.gm4.reeling_rods.death.bleeding","fallback":"%s succumbed to their injuries",with:[{"selector":"@s"}]}]
execute unless entity @s[type=player] on owner run tag @s remove gm4_reeling_rods.owner

# reset barbed state
function gm4_reeling_rods:barbed/clear
