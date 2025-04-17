import base58
import time
from solders.keypair import Keypair
from solders.pubkey import Pubkey
from solders.hash import Hash
from solders.instruction import Instruction
from solders.transaction import Transaction
from solders.message import Message
from solana.rpc.api import Client
from solana.rpc.types import TxOpts

client = Client("https://api.devnet.solana.com")

LAMPORTS_PER_SOL = 1_000_000_000

def generate_wallet():
    kp = Keypair()
    print("🔐 Nueva Wallet Generada:")
    print("  📬 Public Key:", kp.pubkey())
    print("  🔑 Private Key (base58):", base58.b58encode(kp.to_bytes()).decode())
    return kp

def airdrop(pubkey: Pubkey):
    print("🚰 Pidiendo 1 SOL...")
    res = client.request_airdrop(pubkey, LAMPORTS_PER_SOL)
    print("  ⛽ TX:", res)
    print("⏳ Esperando confirmación...")
    time.sleep(5)

def check_balance(pubkey: Pubkey):
    balance = client.get_balance(pubkey)["result"]["value"]
    print(f"💰 Balance: {balance / LAMPORTS_PER_SOL} SOL")

def send_sol(sender: Keypair, recipient_str: str, amount_sol: float):
    recipient = Pubkey.from_string(recipient_str)
    lamports = int(amount_sol * LAMPORTS_PER_SOL)

    recent_blockhash = client.get_latest_blockhash()["result"]["value"]["blockhash"]
    bh = Hash.from_string(recent_blockhash)

    # Instrucción binaria de transferencia SPL
    ix = Instruction(
        program_id=Pubkey.from_string("11111111111111111111111111111111"),  # System program
        accounts=[
            {"pubkey": sender.pubkey(), "is_signer": True, "is_writable": True},
            {"pubkey": recipient, "is_signer": False, "is_writable": True},
        ],
        data=lamports.to_bytes(8, byteorder="little") + b"\x00"  # transfer instruction index = 0
    )

    msg = Message([ix], payer=sender.pubkey(), recent_blockhash=bh)
    tx = Transaction(msg, [sender])
    result = client.send_transaction(tx, opts=TxOpts(skip_preflight=True, preflight_commitment="confirmed"))
    print("✅ Transacción enviada:")
    print("  🔗 TX Hash:", result["result"])

if __name__ == "__main__":
    print("=== Solana Python CLI ===")
    print("1. Generar wallet")
    print("2. Pedir airdrop")
    print("3. Consultar balance")
    print("4. Enviar SOL")
    print("0. Salir")
    opt = input("👉 Opción: ")

    if opt == "1":
        generate_wallet()

    elif opt == "2":
        pk = input("🔑 Public Key: ")
        airdrop(Pubkey.from_string(pk))

    elif opt == "3":
        pk = input("🔍 Public Key: ")
        check_balance(Pubkey.from_string(pk))

    elif opt == "4":
        priv = input("🔐 Private Key (base58): ")
        sender = Keypair.from_bytes(base58.b58decode(priv))
        to = input("📬 Destinatario: ")
        amt = float(input("💸 Monto en SOL: "))
        send_sol(sender, to, amt)

    else:
        print("👋 Bye!")
