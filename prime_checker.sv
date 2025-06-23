module tb;
  int prime_array[1000];
  int num;

  initial begin
    foreach(prime_array[i]) prime_array[i] = i; // Initialize array with 0 to 9

    num = total_prime(prime_array);

    $display("Prime Array: %p, Total Primes: %0d", prime_array, num);
  end

  function int total_prime(int array[]);
    int num_prime ; // Initialize count
    foreach(array[i]) 
      if (is_prime(array[i])) num_prime++;
    
    return num_prime;
  endfunction

  function bit is_prime(int n);
    automatic int d = 3;
    if (n <= 1) return 1'b0; // Not prime if n <= 1
    if (n == 2) return 1'b1; // 2 is prime
    if (n % 2 == 0) return 1'b0; // Exclude even numbers > 2
    while (n >= d**2 ) begin
      if (n % d == 0) return 1'b0; // Not prime if divisible by d
      d += 2; // Increment by 2 (check only odd numbers)
    end
    return 1'b1; // Prime if no divisors found
  endfunction

endmodule

