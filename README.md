### 🚦 **Traffic Light Controller - Verilog Implementation**

---

### 📄 **README**

#### 📌 **Project Description**
The **Traffic Light Controller** is designed using Verilog HDL to manage the traffic signals at a T-junction. The controller uses a **Finite State Machine (FSM)** with six states, each representing a different traffic light configuration. The lights switch between **red, yellow, and green** with specific timings for each state. 

This project uses:
- **Clock signal** for state transition.
- **Reset signal** to initialize the system.
- **Counter** to manage time intervals for light changes.
- **Output signals** representing the light states for **Main Road 1 (M1)**, **Main Road 2 (M2)**, **Main Turning (MT)**, and **Side Road (S)**.

---

#### ⚙️ **Key Features**
- **6-State FSM:** Manages the traffic flow in sequential states.
- **Adjustable Time Intervals:** Each state has a defined time duration (in seconds) before transitioning.
- **Clear Traffic Signals:**
    - `001` → **Green**
    - `010` → **Yellow**
    - `100` → **Red**
- **Sequential state transitions** controlled by the `count` variable.

---

#### 🔧 **Hardware Requirements**
- FPGA development board (e.g., Xilinx, Altera)
- Verilog-compatible simulation software (ModelSim, Xilinx Vivado, or Quartus)

---

#### 🛠️ **Software Requirements**
- Verilog HDL
- Simulation tools: **ModelSim** or **Xilinx Vivado**
- Synthesizer to deploy on FPGA

---

#### 📑 **Pin Description**
| **Signal**   | **Direction** | **Width**  | **Description**                    |
|--------------|--------------|------------|-----------------------------------|
| `clk`        | Input        | 1-bit      | Clock signal for state transition |
| `rst`        | Input        | 1-bit      | Reset signal to initialize states |
| `light_M1`   | Output       | 3-bit      | Light state for Main Road 1       |
| `light_MT`   | Output       | 3-bit      | Light state for Main Turning      |
| `light_M2`   | Output       | 3-bit      | Light state for Main Road 2       |
| `light_S`    | Output       | 3-bit      | Light state for Side Road         |
| `count`      | Output       | 3-bit      | Counter for time intervals        |

---

#### ⏱️ **State Transitions & Timings**
| **State**  | **Description**              | **Duration** |
|------------|------------------------------|--------------|
| `s1`       | M1 Green, MT Red, M2 Green, S Red  | 7 seconds    |
| `s2`       | M1 Green, MT Red, M2 Yellow, S Red | 2 seconds    |
| `s3`       | M1 Green, MT Green, M2 Red, S Red  | 5 seconds    |
| `s4`       | M1 Yellow, MT Yellow, M2 Red, S Red| 2 seconds    |
| `s5`       | M1 Red, MT Red, M2 Red, S Green    | 3 seconds    |
| `s6`       | M1 Red, MT Red, M2 Red, S Yellow   | 2 seconds    |

---

#### ✅ **How to Simulate**
1. Compile the Verilog code in **ModelSim** or **Xilinx Vivado**.
2. Apply clock (`clk`) and reset (`rst`) signals.
3. Observe the **light outputs** and **state transitions**.
4. Verify the FSM operation through simulation waveforms.

---

### ⚙️ **FSM Diagram**
```plaintext
         +-----> S1 ----(7s)----+
         |                      |
         |                      |
         |                      v
         |       +---------> S2 ----(2s)----+
         |       |                         |
         |       |                         v
         |       |          +---------> S3 ----(5s)----+
         |       |          |                         |
         |       |          |                         v
         |       |          |          +---------> S4 ----(2s)----+
         |       |          |          |                         |
         |       |          |          |                         v
         |       |          |          |          +---------> S5 ----(3s)----+
         |       |          |          |          |                         |
         |       |          |          |          |                         v
         +-------+----------+----------+----------+-----------> S6 ----(2s)----+
                                         |
                                         |
                                         v
                                       RESET
```

---

### 🛠️ **ASM Chart**
```plaintext
                    +---------------------+
                    |        START        |
                    +---------------------+
                             |
                             v
                    +---------------------+
                    |  Reset -> Go to S1  |
                    +---------------------+
                             |
                             v
                    +---------------------+
        +---------->|          S1         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        |           |          S2         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        |           |          S3         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        |           |          S4         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        |           |          S5         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        |           |          S6         |---------+
        |           +---------------------+         |
        |                     |                     |
        |                     v                     |
        |           +---------------------+         |
        +---------->|      Go to S1        |--------+
                    +---------------------+
```

---

### ✅ **Explanation of States**
- **S1:** Main Road 1 and Main Road 2 are **green**. Main Turning and Side Road are **red**.
- **S2:** Main Road 2 turns **yellow**, indicating caution.
- **S3:** Main Turning and Main Road 1 turn **green**, allowing turns.
- **S4:** Both Main Roads turn **yellow** for caution.
- **S5:** Side Road turns **green**, others are **red**.
- **S6:** Side Road turns **yellow** before resetting the cycle.

---

### 🚦 **Improvements & Customization**
- You can modify the **state durations** by changing the `sec_7`, `sec_5`, `sec_3`, and `sec_2` parameters.
- Extend the FSM to include pedestrian crossing signals.
- Add a **fault detection mechanism** to handle unexpected states or errors.

---

✅ **By following this README, you should be able to simulate and verify the traffic light controller FSM efficiently. Let me know if you need further modifications, testbenches, or additional features! 🚥**
