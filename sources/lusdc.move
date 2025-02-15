/*
/// Module: local_usdc
module local_usdc::local_usdc;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module local_usdc::lusdc;


use sui::url;
use sui::coin;
public struct LUSDC has drop {}

fun init(witness: LUSDC, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency<LUSDC>(
        witness,
        9,
        b"LUSDC",
        b"LUSDC Coin",
        b"Local USDC",
        option::none(),
        ctx
    );
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    transfer::public_share_object(metadata);
}
