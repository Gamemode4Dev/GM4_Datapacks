# process a player that just tamed a horse (or equivalent)
# @s = player taming the horse
# at @s
advancement revoke @s only gm4_horsemanship:tame_horse

execute on vehicle unless entity @s[tag=gm4_horse] unless entity @s[tag=smithed.entity] run function gm4_horsemanship:level/init_horse
