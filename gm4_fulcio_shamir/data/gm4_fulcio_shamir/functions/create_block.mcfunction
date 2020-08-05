#run from active
#@s = players holding a fulcio compass and looking at air positioned ^ ^ ^3 align xyz

setblock ~ ~ ~ structure_void keep
summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Radius:0,Age:-2147483648,CustomName:'"gm4_fulcio_block"',Tags:["gm4_fulcio_block"],Particle:"block air"}
