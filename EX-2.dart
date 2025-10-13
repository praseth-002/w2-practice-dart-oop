class BankAccount {
    // TODO
    final String _firstName;
    final String _lastName;
    final String _bank;
    final String _bankID;
    double _balance; 

    BankAccount(this._firstName, this._lastName, this._bank, this._bankID, this._balance);

    double get balance => _balance; 

    void withdraw(double amount) {
      if (amount <=0){
        print("Invalid amount to withdraw");
      }else if (balance - amount < 0) {
        print("Insufficient balance in your account");
      } else {
        _balance -= amount;
        print("withdrawn: $amount \ncurrent balane: $balance");
      }
    }

    void credit(double amount) {
      if (amount <=0){
        print("Invalid amount to add");
      } else {
        _balance += amount;
        print("added: $amount \ncurrent balance: $balance");
      }
    }

    @override 
    String toString() {
      return "$_bankID";
    }
}

class Bank {
    // TODO
    final String _name;
    Set<BankAccount> _bankAccounts;

    Bank(this._name, this._bankAccounts);

    BankAccount? createAccount (String fName, String lName, String bID, double balance) {
      for (var bankAccount in _bankAccounts) {
        if(bID == bankAccount._bankID){
          print("Bank ID $bID already exists");
          return null;
        }
      }
      BankAccount nAccount = BankAccount(fName, lName, this._name, bID, balance);
      _bankAccounts.add(nAccount);
      print(_bankAccounts);
      return nAccount;
    }
}
 
void main() {

  // Bank myBank = Bank(name: "CADT Bank");
  // BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  // print(ronanAccount.balance); // Balance: $0
  // ronanAccount.credit(100);
  // print(ronanAccount.balance); // Balance: $100
  // ronanAccount.withdraw(50);
  // print(ronanAccount.balance); // Balance: $50

  // try {
  //   ronanAccount.withdraw(75); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Insufficient balance for withdrawal!
  // }

  // try {
  //   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Account with ID 100 already exists!
  // }

  BankAccount b1 = BankAccount("guy", "luy", "ABA", "1", 0);
  // b1.credit(100);
  // b1.withdraw(100);
  // print(b1.balance);

  Bank ABA = Bank("ABA", {});
  var b2 = ABA.createAccount("Jane", "Johns", "ABA1", 0);
  // var b3 = ABA.createAccount("Jane", "Johns", "ABA1", 0);
  var b3 = ABA.createAccount("Jane", "Johns", "ABA2", 0);
  b2!.credit(100);
  b3!.credit(-100);
  b2!.withdraw(5);



}
