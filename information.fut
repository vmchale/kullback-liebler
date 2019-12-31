-- TODO: float/double polymorphism
-- TODO: matrix convolution
let entropy (x: []f32): f32 =
  reduce (+) 0 (map (\p -> p * f32.log p) x)

let kullback_liebler [n] (x: [n]f32) (y: [n]f32) : f32 =
  reduce (+) 0 (map2 (\p q -> p * f32.log (p / q)) x y)
