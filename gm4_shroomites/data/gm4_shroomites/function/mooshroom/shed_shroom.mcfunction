# plants a mushroom after checking the color of this mooshroom
# @s = @e[type=mooshroom] that are ready to plant a shroomite_shroom
# at @s
# run from gm4_shroomites:mooshroom/process

# analyze mooshroom color
execute unless entity @s[tag=gm4_shroomite_analyzed] run function gm4_shroomites:mooshroom/analyze_color

# plant shroom
function gm4_shroomites:shroom/create
