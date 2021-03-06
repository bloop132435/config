#include <cstdio>
#include <iostream>
#include <vector>

bool is_prime(int n) {
	if(n <= 1) {
		return false;
	}
	for(int i = 2; i * i <= n; i++) {
		if(n % i == 0) {
			return false;
		}
	}
	return true;
}
int main() {
	// first n factorials
	int n;
	std::cin >> n;
	std::vector<int> factorials(n + 1, 1);
	factorials[0] = 1;
	for(int i = 1; i < n; i++) {
		factorials[i] = factorials[i - 1] * i;
	}
	// find the number of primes in factorials
	int num_primes = 0;
	for(int i = 0; i < n; i++) {
		if(is_prime(factorials[i])) {
			num_primes++;
		}
	}
	std::cout << num_primes << std::endl;
}
