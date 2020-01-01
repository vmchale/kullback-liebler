module information (M: real) = {

  open M
  -- TODO: trim zeros?

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

entry entropy_f32 : []f32 -> f32 =
  information_f32.entropy

entry entropy_f64 : []f64 -> f64 =
  information_f64.entropy

entry kullback_liebler_f32 : []f32 -> []f32 -> f32 =
  information_f32.kullback_liebler

entry kullback_liebler_f64 : []f64 -> []f64 -> f64 =
  information_f64.kullback_liebler

-- TODO: bench should scale inputs?

-- Entropy bench
-- ==
-- entry: kullback_liebler_f32
-- compiled random input { [10000000]f32 [10000000]f32 }
-- auto output

-- Entropy bench (64-bit floats)
-- ==
-- entry: kullback_liebler_f64
-- compiled random input { [10000000]f64 [10000000]f64 }
-- auto output
