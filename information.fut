-- TODO: float/douuble polymorphism
-- TODO: matrix convolution
let entropy (x: []f32): f32 =
  reduce (+) 0 (map (\p -> p * f32.log p) x)
