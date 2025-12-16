import Foundation

enum ATMFail: Error {
  case Imbalance
  case WrongPin
}

func withdraw(amount: Int, balance: Int) throws -> Int {
  if amount < balance {
    throw ATMFail.Imbalance
  }
  return amount - balance
}

func attemptwithdraw() -> Int? {
  do {
    let bal = try withdraw(amount: 100, balance: 20)
    return bal
  }
  catch ATMFail.Imbalance {
    print("You're broke!")
    return nil
  }
  catch {
    print("Lol, no idea what's going on!")
    return nil
  }

}
