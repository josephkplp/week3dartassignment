
1. Encapsulation:

class BankAccount {
  // Private variable
  String _accountNumber;
  double _balance;

  // Constructor
  BankAccount(this._accountNumber, this._balance);

  // Public getter for account number (controlled access)
  String get accountNumber => _accountNumber;

  // Public method to access the balance
  double getBalance() {
    return _balance;
  }

  // Public method to deposit money
  void deposit(double amount) {
    _balance += amount;
  }

  // Public method to withdraw money (controlled access to modify private data)
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}


2. Inheritance:

class SavingsAccount extends BankAccount {
  double _interestRate;

  SavingsAccount(String accountNumber, double balance, this._interestRate)
      : super(accountNumber, balance);

  // Method to apply interest
  void applyInterest() {
    deposit(getBalance() * _interestRate);
  }
}


3. Polymorphism:

class CheckingAccount extends BankAccount {
  double _overdraftLimit;

  CheckingAccount(String accountNumber, double balance, this._overdraftLimit)
      : super(accountNumber, balance);

  // Overriding withdraw method with custom logic
  @override
  void withdraw(double amount) {
    if (amount <= getBalance() + _overdraftLimit) {
      super.withdraw(amount);
    } else {
      print("Overdraft limit exceeded");
    }
  }
}


4. Abstraction:

abstract class Account {
  // Abstract method
  void deposit(double amount);
  void withdraw(double amount);
}

class BusinessAccount extends Account {
  double _balance = 0;

  @override
  void deposit(double amount) {
    _balance += amount;
    print("Deposited: $amount, New Balance: $_balance");
  }

  @override
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: $amount, New Balance: $_balance");
    } else {
      print("Insufficient balance");
    }
  }
}
