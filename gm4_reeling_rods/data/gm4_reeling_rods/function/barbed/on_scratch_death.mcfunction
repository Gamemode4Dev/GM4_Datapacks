# handles entities scratched to death
# @s = entity who died by immediate damage from a barbed rod
# at @s
# run from barbed/apply

# death message
execute if entity @s[type=player] run tellraw @a ["",{"translate":"text.gm4.reeling_rods.death.scratch","fallback":"%s was scratched to death by %s",with:[{"selector":"@s"},{"selector":"@p[tag=gm4_reeling_rods.player]"}]}]
execute unless entity @s[type=player] on owner run tag @s add gm4_reeling_rods.owner
execute unless entity @s[type=player] run tellraw @p[tag=gm4_reeling_rods.owner] ["",{"translate":"text.gm4.reeling_rods.death.scratch","fallback":"%s was scratched to death by %s",with:[{"selector":"@s"},{"selector":"@p[tag=gm4_reeling_rods.player]"}]}]
execute unless entity @s[type=player] on owner run tag @s remove gm4_reeling_rods.owner

# reset barbed state
function gm4_reeling_rods:barbed/clear
