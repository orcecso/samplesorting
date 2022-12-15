library sort;

extension ExStringSort on List<String> {
  List<String> quickSort() {
    sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return this;
  }
}

// bubbleSort(List<String> array) {
//   int lengthOfArray = array.length;
//   for (int i = 0; i < lengthOfArray - 1; i++) {
//     for (int j = 0; j < lengthOfArray - i - 1; j++) {
//       if (array[j] > array[j + 1]) {
//         // Swapping using temporary variable
//         String temp = array[j];
//         array[j] = array[j + 1];
//         array[j + 1] = temp;
//       }
//     }
//   }
//   return (array);
// }
