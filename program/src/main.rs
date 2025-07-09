#![no_main]
sp1_zkvm::entrypoint!(main);

use alloy_sol_types::SolType;
use sha1_lib::{sha1, PublicValuesStruct};

pub fn main() {
    let calldata = sp1_zkvm::io::read::<Vec<u8>>();
    let h = sha1(&calldata);
    sp1_zkvm::io::commit(&h);

    // let bytes = PublicValuesStruct::abi_encode(&PublicValuesStruct { h });
    // sp1_zkvm::io::commit_slice(&bytes);
}
