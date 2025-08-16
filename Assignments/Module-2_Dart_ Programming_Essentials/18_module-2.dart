class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, [this.balance = 0.0]);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposited: ₹$amount');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive.');
    } else if (amount > balance) {
      print('Insufficient funds. Withdrawal denied.');
    } else {
      balance -= amount;
      print('Withdrawn: ₹$amount');
    }
  }

  void checkBalance() {
    print('Account Holder: $accountHolder');
    print('Account Number: $accountNumber');
    print('Current Balance: ₹$balance');
  }
}

void main() {
  BankAccount myAccount = BankAccount('1234567890', 'Dharmik Makvana', 5000.0);

  myAccount.checkBalance();
  myAccount.deposit(1500.0);
  myAccount.withdraw(2000.0);
  myAccount.withdraw(6000.0);
  myAccount.checkBalance();
}
/*
Account Holder: Dharmik Makvana
Account Number: 1234567890
Current Balance: ₹5000.0
Deposited: ₹1500.0
Withdrawn: ₹2000.0
Insufficient funds. Withdrawal denied.
Account Holder: Dharmik Makvana
Account Number: 1234567890
Current Balance: ₹4500.0
 */