module information (M: real) = {

  open M

  let scale [n] (x: [n]M.t): [n]M.t =
    let tot = sum x
      in map (/tot) x

  let entropy (x: []M.t): M.t =
    negate (sum (map (\p -> p * log p) x))

  let kullback_liebler [n] (x: [n]M.t) (y: [n]M.t) : M.t =
    sum (map2 (\p q -> p * log (p / q)) x y)
}

module information_f32 = information f32
module information_f64 = information f64

entry entropy_scaled_f32 (x: []f32) : f32 =
  information_f32.entropy(information_f32.scale x)

-- Entropy (unscaled)
-- ==
-- entry: entropy_scaled_f32
-- input { [1.0f32, 2.0f32, 3.0f32] }
-- output { 1.011404f32 }
