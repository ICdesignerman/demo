# **RSA_IP with counter on HAPS in Verilog**
Modules include
- Top
- RSA_IP
- Counter

## Description

### RSA_IP
- Introduction
RSA is a public-key cryptosystem that is widely used for secure data transmission, and is also one of the oldest. The acronym “RSA” comes from the surnames of Ron Rivest, Adi Shamir and Leonard Adleman, who publicly described the algorithm in 1977. RSA involves a public key and a private key. The public key can be known by everyone and is used for encrypting messages. The intention is that messages encrypted with public key can only be decrypted in a reasonable amount of time by using the private key. Since the process of encryption and decryption use different keys, the RSA cryptosystem is also known as asymmetric cryptosystem.

- Key generation 
generate the keys for the RSA algorithm in the following way:
1. Choose two distinct prime numbers p and q. 
2. Compute 𝑁 = 𝑝𝑞. 
3. Compute Euler totient function 𝜑(𝑁) = (𝑝 − 1)(𝑞 − 1), that is, the amount of integers that smaller and coprime with N. 
4. Choose an integer e such that 1 < 𝑒 < 𝜑(𝑁) and 𝑔𝑐𝑑(𝑒,𝜑(𝑁)) = 1. 
5. Determine d such that 𝑒𝑑 ≡ 1(𝑚𝑜𝑑 𝜑(𝑁)). 
6. Acquire public key 𝐾𝑈 = {𝑒, 𝑁} and private key 𝐾𝑅 = {𝑑, 𝑁}.

 **Example** 
  1. Choose two distinct prime numbers, 𝑝 = 61, 𝑞 = 53. 
  2. Compute 𝑁 = 61 × 53 = 3233. 
  3. Compute 𝜑(𝑁) = (61 − 1)(53 − 1) = 3120. 
  4. Choose 𝑒 = 17. ( 1 < 𝑒 < 𝜑(𝑁), 𝑔𝑐𝑑(𝑒,𝜑(𝑁)) = 1 ) 
  5. Compute 𝑑 = 2753. (one of the possible answers that satisfy 𝑒𝑑 ≡ 1(𝑚𝑜𝑑 𝜑(𝑁)) ) 
  6. Acquire public key 𝐾𝑈 = {17, 3233} and private key 𝐾𝑅 = {2753, 3233}.


- RSA_IP 


  Given two distinct prime numbers p, q, and integer e, the IP need to calculate the private key, that is, 𝐾𝑅 = {𝑑, 𝑁}.
  d can be computed effectively by using the extended Euclidean algorithm. If the result is smaller than 0, plus 𝜑(𝑛) to turn negative to positive.

  The standard Euclidean algorithm proceeds by a succession of Euclidean divisions whose quotients are not used. Only the remainders are kept. 
  For the extended algorithm, the successive quotients are used. More precisely, the standard Euclidean algorithm with a and b as input, consists of computing a         sequence  of q1,…,qk quotients and a sequence r0,…,rk+1 of remainders such that



![image](https://user-images.githubusercontent.com/118537645/233063202-3a8c0a00-967b-4ee3-8cce-3671232a7003.png)


It is the main property of Euclidean divisions that the inequalities on the right define uniquely qi and ri+1 from  ri-1 and ri
The computation stops when one reaches a remainder  ri+1 which is zero; the greatest common divisor is then the last non zero remainder  ri


![image](https://user-images.githubusercontent.com/118537645/233063464-817f4aec-d952-4892-bf5d-65f878ce7f95.png)


Input signals: IN_P,、IN_Q、IN_E
Output signals: OUT_N,、OUT_D

![image](https://user-images.githubusercontent.com/118537645/233063522-9f71cab0-137b-4631-847c-8ddd55e15328.png)

### Counter
Counter is to generate RSA_IP INPUT (IN_P,、IN_Q、IN_E)

### Top
Connect RSA_IP and Counter together

### 2.Block diagram

### 3.The schematics of FPGA_A and FPGA_B

![image](https://user-images.githubusercontent.com/118537645/233610635-8ae5bb99-2f35-4d3c-80df-7ff5a1915661.png)


### 4.Timing report
Setup time: Check WNS and TNS in FB1_uA_timing_summary.txt
![image](https://user-images.githubusercontent.com/118537645/233609132-07187046-05b0-4c7b-b3cb-83ca5268c9a7.png)

Hold time:  Check WHS and THS in FB1_uA_timing_summary_Min.txt
![image](https://user-images.githubusercontent.com/118537645/233608884-0a9aa01d-bc45-49e1-a0f4-d4480d86a3bc.png)

Setup time: Check WNS and TNS in FB1_uB_timing_summary.txt
![image](https://user-images.githubusercontent.com/118537645/233609655-f3493af7-ad5d-4cdd-961d-7125eaebe739.png)

Hold time:  Check WHS and THS in FB1_uB_timing_summary_Min.txt
![image](https://user-images.githubusercontent.com/118537645/233609565-087ee157-bbe7-4ebd-bc9b-1552842a98eb.png)

### 5.Conclusion
