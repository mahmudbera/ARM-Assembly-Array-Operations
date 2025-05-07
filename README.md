# ARM-Assembly-Array-Operations

📦 **ARM Assembly Array Operations**

This project is an ARM Assembly implementation that performs two fundamental operations on an array of integers: **bul (searching)** for a specific value and **sirala (sorting)** the array using the Counting Sort algorithm. The program selects which operation to perform based on a predefined flag.

---

## 📌 Features

- 🔍 **Search Function (`find`)**  
  Scans the array for a specific value and returns `1` if found, or `0` if not.

- 📊 **Counting Sort Function (`sort`)**  
  Sorts the elements of the array in ascending order using the Counting Sort algorithm — an efficient method for small, non-negative integer arrays.

---

## 📑 How It Works

- The array is defined in the **data section**, with the first element representing the number of values it holds.
- A flag determines whether the program will perform a **bul (search)** or a **sirala (sort)** operation.
- If **searching**, it iterates through the array and compares each element to the target value.
- If **sorting**, it applies the Counting Sort algorithm and overwrites the original array with the sorted values.

---

## 📂 Code Structure

- **`main`**: Program entry point and operation selector.
- **`find`**: Search procedure.
- **`sort`**: Counting Sort procedure.
- **Data Section**: Contains the integer array and a temporary `counts` array used during the sorting process.

---

## 📝 Notes

- Designed for educational purposes to demonstrate low-level data operations using ARM Assembly.
- Optimized for small, non-negative integer arrays.
