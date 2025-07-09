use alloy_sol_types::sol;
use sha1::{Digest, Sha1};

sol! {
    /// The public values encoded as a struct that can be easily deserialized inside Solidity.
    struct PublicValuesStruct {
        uint64 h;
    }
}

pub fn sha1(data: &[u8]) -> u64 {
    let mut hasher = Sha1::new();
    hasher.update(&data);
    let h = hasher.finalize();
    let h = h.as_slice();
    let h = u64::from_be_bytes([h[0], h[1], h[2], h[3], h[4], h[5], h[6], h[7]]);
    h
}
