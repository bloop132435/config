#include <cstdio>
#include <iostream>
#include <vector>
int main() {
	// first n factorials
	int n;
	std::cin >> n;
	std::vector<int> factorials(n + 1, 1);
	factorials[0] = 1;
	for(int i = 1; i < n; i++) {
		factorials[i] = factorials[i - 1] * i;
	}
}
