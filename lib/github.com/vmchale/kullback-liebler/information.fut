-- | Module containing various information-theoretic functions on (discrete) distributions represented as arrays
module type information = {

  type real

  -- TODO: mutable scale?
  val scale [n]: [n]real -> [n]real

  -- | Compute the entropy of a distribution
  val entropy [n]: [n]real -> real

  -- | Compute the Kullback-Liebler distribution of two distributions
  val kullback_liebler [n]: [n]real -> [n]real -> real

  val alpha_divergence [n]: (alpha: real) -> [n]real -> [n]real -> real

  -- | Hellinger distance
  val hellinger [n]: [n]real -> [n]real -> real

}

module mk_information(M: real): (
  information with real = M.t
  ) = {

  local open M

  type real = M.t

  let scale (x) =
    let tot = sum x
      in map (/tot) x

  let entropy (x) =
    neg (sum (map (\p -> p * log p) x))

  let kullback_liebler (x) (y) =
    sum (map2 (\p q -> p * log (p / q)) x y)

  local let two = from_fraction 2 1
  local let four = from_fraction 4 1
  local let one = from_fraction 1 1

  let alpha_divergence (alpha)(x)(y) =
    (four / (one - (alpha ** two))) * (one -
      sum (map2 (\p q -> p ** ((one - alpha)/two) * q ** ((one + alpha)/two)) x y))

  let hellinger (x)(y) =
    sqrt (two *
      (sum (map2 (\p q -> (sqrt p - sqrt q) ** two) x y)))

}

module information_f32 = mk_information f32
module information_f64 = mk_information f64

entry entropy_f64 =
  information_f64.entropy

entry entropy_scaled_f64 =
  information_f64.entropy <-< information_f64.scale

entry kullback_liebler_f64 =
  information_f64.kullback_liebler

entry kullback_liebler_scaled_f64 (x: []f64) (y: []f64) : f64 =
  information_f64.kullback_liebler (information_f64.scale x) (information_f64.scale y)

entry entropy_f32 =
  information_f32.entropy

entry entropy_scaled_f32 =
  information_f32.entropy <-< information_f32.scale

entry kullback_liebler_f32 =
  information_f32.kullback_liebler

entry kullback_liebler_scaled_f32 (x: []f32) (y: []f32) : f32 =
  information_f32.kullback_liebler (information_f32.scale x) (information_f32.scale y)

entry hellinger_f32 = information_f32.hellinger
entry hellinger_f64 = information_f64.hellinger
entry alpha_divergence_f32 = information_f32.alpha_divergence
entry alpha_divergence_f64 = information_f64.alpha_divergence

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
