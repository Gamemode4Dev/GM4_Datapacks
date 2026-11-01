data modify storage gm4_player_motion:internal/temp matrix.ix set from storage gm4_player_motion:internal/temp vec_i[0]
data modify storage gm4_player_motion:internal/temp matrix.iz set from storage gm4_player_motion:internal/temp vec_i[2]

data modify storage gm4_player_motion:internal/temp matrix.jx set from storage gm4_player_motion:internal/temp vec_j[0]
data modify storage gm4_player_motion:internal/temp matrix.jy set from storage gm4_player_motion:internal/temp vec_j[1]
data modify storage gm4_player_motion:internal/temp matrix.jz set from storage gm4_player_motion:internal/temp vec_j[2]

data modify storage gm4_player_motion:internal/temp matrix.kx set from storage gm4_player_motion:internal/temp vec_k[0]
data modify storage gm4_player_motion:internal/temp matrix.ky set from storage gm4_player_motion:internal/temp vec_k[1]
data modify storage gm4_player_motion:internal/temp matrix.kz set from storage gm4_player_motion:internal/temp vec_k[2]

function gm4_player_motion:internal/math/global/matrix_to_vector with storage gm4_player_motion:internal/temp matrix

return 1
