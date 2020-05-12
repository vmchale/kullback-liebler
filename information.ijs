entropy =: - @ (+/ @ (] * ^.))

scale =: ] % +/

randGen =: ([: ? 0 $~ ])

randDist =: scale @ randGen

time =: (6!:2)

harmonic =: (+/ % #) &.: %
power_mean =: adverb : '(+/ % #) &.: (^&x)'
harm =: _1 power_mean
