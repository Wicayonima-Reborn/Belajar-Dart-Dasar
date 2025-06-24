void main() {
  // 1. Pakai for loop untuk print angka dari 1 sampai 10
  for (int i = 0; i <= 10; i++) {
    print(i);
  }
  // 2. Pakai while loop untuk print "Push rank!" sebanyak 5x
int angka = 0;
  while (angka < 5) {
    print('Push rank!');
    angka += 1;
    }
  // 3. Bonus: pakai do-while untuk print "Login bonus diterima!" minimal sekali, walaupun gold = 100
int duit = 100;
  do {
    print('Bonus login diterima!');
  } while (duit < 30);
}
