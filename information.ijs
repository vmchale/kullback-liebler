entropy =: - @ (+/ @ (] * ^.))

scale =: ] % +/

randGen =: ([: ? 0 $~ ])

randDist =: scale @ randGen

time =: (6!:2)
