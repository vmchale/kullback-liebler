entropy =: - @ (+/ @ (] * ^.))

scale =: ] % +/

randGen =: ([: ? 0 $~ ])

randDist =: scale @ randGen

simpleTime =: (6!:2)
