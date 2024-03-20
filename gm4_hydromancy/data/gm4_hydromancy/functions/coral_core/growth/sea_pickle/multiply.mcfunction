# add 1 pickle to this cluster
# @s = growth marker
# at @s
# run from coral_core/growth/sea_pickle/base

function gm4_hydromancy:coral_core/growth/vfx
fill ~ ~ ~ ~ ~ ~ sea_pickle[pickles=4] replace sea_pickle[pickles=3]
fill ~ ~ ~ ~ ~ ~ sea_pickle[pickles=3] replace sea_pickle[pickles=2]
fill ~ ~ ~ ~ ~ ~ sea_pickle[pickles=2] replace sea_pickle[pickles=1]
