let kullback_liebler [n] (x: [n]f32) (y: [n]f32) : f32 =
  reduce (+) 0 (map2 (\p q -> p * f32.log (p / q)) x y)

module information (M: real) = {

  open M

  let entropy(x: []M.t): M.t =
    sum (map (\p -> p * log p) x)

  let kullback_liebler [n] (x: [n]M.t) (y: [n]M.t) : M.t =
    sum (map2 (\p q -> p * log (p / q)) x y)
}

module information_f32 = information f32
module information_f64 = information f64
