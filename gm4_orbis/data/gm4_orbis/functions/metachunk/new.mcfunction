# Create a new metachunk marker, but don't initialize it yet
# inside the bounds of the metachunk
# run from main and metachunk/generate

execute positioned ~-24 -1 ~-24 unless entity @e[type=marker,tag=gm4_metachunk,dx=47,dy=1,dz=47] run summon marker ~24 0.0 ~24 {CustomName:'"gm4_metachunk"',Tags:["gm4_metachunk","gm4_metachunk_init"]}
