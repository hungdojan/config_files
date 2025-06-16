#include <bits/stdc++.h>
using namespace std;

#define I_2D(row, col, width) ((row) * (width) + (col))
#define endl '\n'
#define PRINT_ARR(arr, n, sep)                                                 \
  do {                                                                         \
    for (int i = 0; i < n; i++) {                                              \
      cout << arr[i] << sep;                                                   \
    }                                                                          \
    cout << endl;                                                              \
  } while (0)
#define PRINT_VEC(v, sep)                                                      \
  do {                                                                         \
    for (auto &i : v) {                                                        \
      cout << i << sep;                                                        \
    }                                                                          \
    cout << endl;                                                              \
  } while (0)
#define PRINT_VEC_ARR(v, n, sep)                                               \
  do {                                                                         \
    for (int i = 0; i < n; i++) {                                              \
      cout << i << ": ";                                                       \
      PRINT_VEC(v[i], sep);                                                    \
    }                                                                          \
  } while (0)
#define PRINT_MAT(m, sep)                                                      \
  do {                                                                         \
    for (auto &row : m) {                                                      \
      PRINT_VEC(row, sep);                                                     \
    }                                                                          \
  } while (0)

typedef long long ll;

int main() {
  ios::sync_with_stdio(0);
  cin.tie(0);
  // TODO:
  return 0;
}
