module information (M: real) = {

  open M

  let scale [n] (x: [n]t): [n]t =
    let tot = sum x
      in map (/tot) x

  let entropy (x: []t): t =
    negate (sum (map (\p -> p * log p) x))

  let kullback_liebler [n] (x: [n]t) (y: [n]t) : t =
    sum (map2 (\p q -> p * log (p / q)) x y)

}

module information_f32 = information f32
module information_f64 = information f64

entry entropy_f64 : []f64 -> f64 =
  information_f64.entropy

entry entropy_scaled_f64 : []f64 -> f64 =
  information_f64.entropy <-< information_f64.scale

entry kullback_liebler_f64 : []f64 -> []f64 -> f64 =
  information_f64.kullback_liebler

entry kullback_liebler_scaled_f64 (x: []f64) (y: []f64) : f64 =
  information_f64.kullback_liebler (information_f64.scale x) (information_f64.scale y)

-- Kullback-Liebler bench (64-bit floats)
-- ==
-- entry: kullback_liebler_scaled_f64
-- compiled random input { [10000000]f64 [10000000]f64 }
-- auto output

-- Entropy bench (64-bit floats)
-- ==
-- entry: entropy_scaled_f64
-- compiled random input { [10000000]f64 }
-- auto output
